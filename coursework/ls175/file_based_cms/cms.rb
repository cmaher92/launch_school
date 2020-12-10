require 'sinatra'
require "sinatra/reloader" if development?
require 'tilt/erubis'
require 'pry'
require 'redcarpet'

configure do
  enable :sessions
  set :session_secret, 'super secret'
end

def render_markdown(text)
  md = Redcarpet::Markdown.new(
    Redcarpet::Render::HTML,
    fenced_code_blocks: true,
    disable_indented_code_blocks: true
  )
  md.render(text)
end

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

def file_path(file)
  File.expand_path('..', __FILE__) + "/data/" + file
end

def data_path
  if ENV["RACK_ENV"] == 'test'
    File.expand_path("../test/data", __FILE__)
  else
    File.expand_path("../data", __FILE__)
  end
end

get '/' do
  pattern = File.join(data_path, "*")

  @files = Dir.glob(pattern).map do |path|
    File.basename(path)
  end

  erb :index
end

get '/new' do
  erb :new
end

# create a file
post '/new' do
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
  file_path = File.join(data_path, params[:filename])

  File.write(file_path, params[:content])

  session[:message] = "#{params[:filename]} has been updated."
  redirect "/"
end
