require "sinatra"
require "sinatra/reloader"
require "sinatra/content_for"
require "tilt/erubis"

configure do
  enable :sessions
  set :session_secret, 'secret' 
end

helpers do
  def list_complete?(list)
    todos_count(list) > 0 && todos_remaining_count(list) == 0
  end

  def list_class(list)
    "complete" if list_complete?(list)
  end

  def todos_count(list)
    list[:todos].size
  end

  def todos_remaining_count(list)
    list[:todos].select { |todo| !todo[:completed] }.size
  end
end

before do
  session[:lists] ||= []
end

get "/" do
  redirect "/lists"
end

# Method + resource type
# GET  /lists       -> view all lists
# GET  /lists/new   -> new list form
# POST /lists       -> create new lists
# GET  /lists/1     -> view single list

# view all lists
get "/lists" do
  @lists = session[:lists].sort_by { |list| list_complete?(list) ? 1 : 0 }
  erb :lists, layout: :layout
end

# render new list form
get "/lists/new" do
  erb :new_list, layout: :layout
end

# return an error message if the name is invalid
# return nil if valid
def error_for_list_name(name)
  if !(1..100).cover? name.size
    "List name must be between 1 and 100 characters."
  elsif session[:lists].any? { |l| l[:name] == name }
    "List name must be unique."
  end
end

# return an error message if name is invalid
# return nil if valid
def error_for_todo(name)
  if !(1..100).cover? name.size
    "Todo must be between 1 and 100 characters."
  end
end

# view a single todo list
get "/lists/:id" do
  @list_id = params[:id].to_i
  @list = session[:lists][@list_id]
  erb :list, layout: :layout
end

# edit an existing todo list
get "/lists/:id/edit" do
  id = params[:id].to_i
  @list = session[:lists][id]
  erb :edit_list, layout: :layout 
end

# delete an existing list
post "/lists/:id/destroy" do
  id = params[:id].to_i
  deleted_list = session[:lists].delete_at(id)
  session[:success] = "The #{deleted_list[:name]} list has been deleted."
  redirect "/lists"
end

# update an existing to do list
post "/lists/:id" do
  list_name = params[:list_name].strip
  id = params[:id].to_i
  @list = session[:lists][id]
  
  error = error_for_list_name(list_name)
  if error 
    session[:error] = error
    erb :edit_list, layout: :layout
  else
    @list[:name] = list_name
    session[:success] = "The list has been updated."
    redirect "/lists/#{id}"
  end
end

# complete all items in a list
post "/lists/:id/complete_all" do
  @list_id = params[:id].to_i
  @list = session[:lists][@list_id]

  @list[:todos].each { |todo| todo[:completed] = true }
  session[:success] = "All of the todos have been marked complete."
  redirect "/lists/#{@list_id}"
end

# Add a new todo item to a list
post "/lists/:list_id/todos" do
  # :list_id makes it clearer which object the id is for
  @list_id = params[:list_id].to_i
  @list = session[:lists][@list_id]
  text = params[:todo].strip

  error = error_for_todo(text)
  if error
    session[:error] = error
    erb :list, layout: :layout
  else
    @list[:todos] << { name: params[:todo], completed: false }
    session[:success] = "The todo was added."
    redirect "/lists/#{@list_id}"
  end
end

# Remove a todo item
post "/lists/:list_id/todos/:todo_id/destroy" do
  @list_id = params[:list_id].to_i
  @todo_id = params[:todo_id].to_i
  deleted_todo = session[:lists][@list_id][:todos].delete_at(@todo_id)
  session[:success] = "The '#{deleted_todo[:name]}' todo has been deleted."
  redirect "/lists/#{@list_id}"
end

# Complete a todo item
post "/lists/:list_id/todos/:todo_id" do
  @list_id = params[:list_id].to_i
  @list = session[:lists][@list_id]

  todo_id = params[:todo_id].to_i
  is_completed = params[:completed] == "true"
  @list[:todos][todo_id][:completed] = is_completed
  session[:success] = "The todo has been updated."
  redirect "/lists/#{@list_id}"
end

# creates new list
post "/lists" do
  list_name = params[:list_name].strip
  
  error = error_for_list_name(list_name)
  if error 
    session[:error] = error
    erb :new_list, layout: :layout
  else
    session[:lists] << { name: params[:list_name], todos: [] }
    session[:success] = "The list has been created."
    redirect "/lists"
  end
end

