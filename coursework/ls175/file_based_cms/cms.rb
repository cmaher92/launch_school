require 'sinatra'
require 'sinatra/reloader' if development?
require 'sinatra/content_for'
require 'tilt/erubis'
require 'pry' if development?
require 'redcarpet'
require 'fileutils'
require 'yaml'
require 'bcrypt'

configure do
  enable :sessions
  set    :session_secret, 'super secret'
end

def render_markdown(text)
  md = Redcarpet::Markdown.new(
    Redcarpet::Render::HTML,
    fenced_code_blocks: true,
    disable_indented_code_blocks: true
  )
  md.render(text)
end

def load_user_credentials
  credentials_path = if ENV["RACK_ENV"] == "test"
    File.expand_path("../test/database.yml", __FILE__)
  else
    File.expand_path("../database.yml", __FILE__)
  end
  YAML.load_file(credentials_path)
end

# loads a file based on file ext
def load_file_content(path)
  content = File.read(path)
  case File.extname(path)
  when '.txt'
    headers['Content-Type'] = 'text/plain'
    content
  when '.md'
    @md = render_markdown(content)
    erb :md
  end
end

def data_path
  if ENV["RACK_ENV"] == 'test'
    File.expand_path("../test/data", __FILE__)
  else
    File.expand_path("../data", __FILE__)
  end
end

def user_signed_in?
  session.key?(:username)
end

def require_signed_in_user
  unless user_signed_in?
    session[:message] = "You must be signed in to do that."
    redirect "/"
  end
end

def valid_credentials?(username, password)
  credentials = load_user_credentials

  if credentials.key?(username)
    bcrypt_password = BCrypt::Password.new(credentials[username])
    bcrypt_password == password
  else
    false
  end
end

get '/' do
  binding.pry
  pattern = File.join(data_path, "*")

  @files = Dir.glob(pattern).map do |path|
    File.basename(path)
  end

  erb :index
end

get '/new' do
  require_signed_in_user

  erb :new
end

# create a file
post '/new' do
  require_signed_in_user

  filename = params['filename']
  if filename.empty?
    session[:message] = 'A name is required.'
    status 422
    erb :new
  else
    File.new(File.join(data_path, filename), 'w')
    session[:message] = "#{filename} was created."
    redirect '/'
  end
end

# read a file
get "/:filename" do
  file_path = File.join(data_path, params[:filename])

  if File.exist?(file_path)
    load_file_content(file_path)
  else
    session[:message] = "#{params[:filename]} does not exist."
    redirect "/"
  end
end

# update a file
get "/:filename/edit" do
  require_signed_in_user

  file_path = File.join(data_path, params[:filename])

  if File.exist?(file_path)
    @filename = params[:filename]
    @content = File.read(file_path)
    erb :edit
  else
    session[:message] = "#{params[:filename]} does not exist."
    redirect "/"
  end
end

# update a file
post "/:filename" do
  require_signed_in_user

  file_path = File.join(data_path, params[:filename])

  File.write(file_path, params[:content])

  session[:message] = "#{params[:filename]} has been updated."
  redirect "/"
end

# delete a file
post "/:filename/delete" do
  require_signed_in_user

  file_path = File.join(data_path, params[:filename])
  File.delete(file_path)
  session[:message] = "#{params[:filename]} was deleted."
  redirect "/"
end

get '/users/login' do
  erb :login
end

post '/users/login' do
  username = params[:username]

  if valid_credentials?(username, params[:password])
    session[:username] = params[:username]
    session[:message]  = "You have successfully logged in."
    redirect '/'
  else
    session[:message] = "Invalid credentials."
    status 422
    erb :login
  end
end

post '/users/logout' do
  session.delete(:username)
  session[:message] = "You have been logged out."
  redirect '/'
end
