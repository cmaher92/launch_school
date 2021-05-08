# sets the ENV environment variable so Sinatra doesn't
# start web server
ENV['RACK_ENV'] = 'test'

require 'pry'
require 'minitest/autorun'
require 'rack/test'
require 'fileutils'
require "minitest/reporters"
Minitest::Reporters.use!

require_relative '../cms'

class CMSTest < Minitest::Test
  # include a module providing methods for testing
  # rack applications
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  # creates a directory for testing
  def setup
    FileUtils.mkdir_p(data_path)
  end

  # removes directory used for testing
  def teardown
    FileUtils.rm_rf(data_path)
  end

  # create a file in the test/data/ directory
  # optionally write to file
  def create_document(name, content = "")
    File.open(File.join(data_path, name), "w") do |file|
      file.write(content)
    end
  end

  def session
    last_request.env['rack.session']
  end

  def admin_session
    { "rack.session" => { username: "admin" }}
  end

  def test_index
    create_document "about.md"
    create_document "changes.txt"

    get "/"

    assert_equal 200, last_response.status
    assert_equal "text/html;charset=utf-8", last_response["Content-Type"]
    assert_includes last_response.body, "about.md"
    assert_includes last_response.body, "changes.txt"
  end

  def test_index_not_logged_in
    get "/"
    assert_nil session[:username]
  end

  def test_index_logged_in
    get "/", {}, { "rack.session" => { username: "admin" } }
    assert_equal "admin", session[:username]
  end

  def test_view_new_document_form
    get "/new", {}, admin_session

    assert_equal 200, last_response.status
    assert_includes last_response.body, "<input"
    assert_includes last_response.body, %q(<button type="submit")
  end

  def test_creating_new_document
    # make post request w/ params set as { filename: 'test.txt' }
    post "/new", { filename: 'test.txt' }, admin_session

    # test response returns 302
    assert_equal 302, last_response.status

    # test that the last request session has :message key set
    assert_equal "test.txt was created.", session[:message]

    # make another request checking that the session has been cleared
    get '/'
    assert_nil session[:message]
  end

  def test_create_new_document_without_filename
    post "/new", { filename: "" }, admin_session

    assert_equal 422, last_response.status
    assert_includes last_response.body, "A name is required."
  end

  def test_viewing_text_document
    create_document "about.txt", "Ruby"
    get '/about.txt'

    assert last_response.ok?
    assert_equal "text/plain", last_response['Content-Type']
    assert_includes last_response.body, "Ruby"
  end

  def test_viewing_md_document
    create_document "study_guide.md", "# Study Guide"
    get '/study_guide.md'

    assert last_response.ok?
    assert_equal "text/html;charset=utf-8", last_response['Content-Type']
    assert_includes last_response.body, "<h1>Study Guide</h1>"
  end

  def test_document_not_found
    # Attempt to access a nonexistent file
    get "/notafile.ext"

    # Assert that the user was redirected
    assert_equal 302, last_response.status
    assert_equal "notafile.ext does not exist.", session[:message]

    # Reload the page
    get "/"

    # Assert that our message has been removed
    assert_nil session[:message]
  end

  def test_editing_document_when_not_signed_in
    create_document "test.txt"
    get "/test.txt/edit"

    assert_equal 302, last_response.status

    assert_equal "You must be signed in to do that.", session[:message]
  end

  def test_editing_document
    create_document "changes.txt"
    get "/changes.txt/edit", {}, admin_session

    assert_equal 200, last_response.status
    assert_includes last_response.body, "<textarea"
    assert_includes last_response.body, "button type=\"submit\""
  end

  def test_updating_document
    post "/changes.txt", { content: "new content" }, admin_session

    assert_equal 302, last_response.status
    assert_equal "changes.txt has been updated.", session[:message]

    get "/changes.txt"
    assert_equal 200, last_response.status
    assert_includes last_response.body, "new content"
  end

  def test_deleting_document
    create_document 'test.txt'

    post "/test.txt/delete", {}, admin_session
    assert_equal 302, last_response.status
    assert_equal "test.txt was deleted.", session[:message]

    follow_redirect!
    assert_equal 200, last_response.status
    refute_includes last_response.body, "test.txt</a>"
  end

  def test_deleting_document_not_logged_in
    create_document "test.txt"

    post "/test.txt/delete"
    assert_equal 302, last_response.status
    assert_equal "You must be signed in to do that.", session[:message]
  end

  def test_signin_form
    get "/users/login"

    assert_equal 200, last_response.status
    assert_includes last_response.body, "<input"
    assert_includes last_response.body, %q(<button type="submit")
  end

  def test_login
    post '/users/login', { username: "connor", password: "password" }
    assert_equal 302, last_response.status
    assert_equal "You have successfully logged in.", session[:message]
    assert_equal "connor", session[:username]

    follow_redirect!
    assert_includes last_response.body, "You are logged in as connor"
  end

  def test_login_with_bad_credentials
    post "/users/login", username: "guest", password: "shhhh"
    assert_equal 422, last_response.status
    assert_nil session[:username]
    assert_includes last_response.body, "Invalid credentials"
  end

  def test_logout
    get "/", {}, { "rack.session" => { username: "admin" } }
    assert_equal "admin", session[:username]
    post "/users/logout"
    assert_equal "You have been logged out.", session[:message]
    assert_nil session[:username]
  end
end
