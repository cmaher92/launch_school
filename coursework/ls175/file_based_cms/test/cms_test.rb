# sets the ENV environment variable so Sinatra doesn't
# start web server
ENV['RACK_ENV'] = 'test'

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

  def test_index
    create_document "about.md"
    create_document "changes.txt"

    get "/"

    assert_equal 200, last_response.status
    assert_equal "text/html;charset=utf-8", last_response["Content-Type"]
    assert_includes last_response.body, "about.md"
    assert_includes last_response.body, "changes.txt"
  end

  def test_view_new_document_form
    get "/new"

    assert_equal 200, last_response.status
    assert_includes last_response.body, "<input"
    assert_includes last_response.body, %q(<button type="submit")
  end

  def test_creating_new_document
    post "/new", filename: 'test.txt'

    assert_equal 302, last_response.status

    follow_redirect!

    assert_equal 200, last_response.status
    assert_includes last_response.body, "test.txt was created"

    get '/'
    refute_includes last_response.body, "test.txt was created"
  end

  def test_create_new_document_without_filename
    post "/new", filename: ""

    assert_equal 422, last_response.status
    assert_includes last_response.body, "A name is required"
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

    # Request the page that the user was redirected to
    get last_response["Location"]

    assert_equal 200, last_response.status
    assert_includes last_response.body, "notafile.ext does not exist"

    # Reload the page
    get "/"
    # Assert that our message has been removed
    refute_includes last_response.body, "notafile.ext does not exist"
  end

  def test_editing_document
    create_document "changes.txt"
    get "/changes.txt/edit"

    assert_equal 200, last_response.status
    assert_includes last_response.body, "<textarea"
    assert_includes last_response.body, "button type=\"submit\""
  end

  def test_updating_document
    # post(uri, params = {}, env = {}, block)
    post "/changes.txt", content: "new content"

    assert_equal 302, last_response.status

    get last_response["Location"]

    assert_includes last_response.body, "changes.txt has been updated"

    get "/changes.txt"
    assert_equal 200, last_response.status
    assert_includes last_response.body, "new content"
  end

  def test_deleting_document
    create_document 'test.txt'
    post "/test.txt/delete"

    assert_equal last_response.status, 302
    follow_redirect!
    assert_equal last_response.status, 200
    assert_includes last_response.body, "test.txt was deleted"
    refute_includes last_response.body, "test.txt</a>"

    get "/"
    refute_includes last_response.body,
                    "<p class=\"alert-msg\">test.txt was deleted.</p>"
  end
end
