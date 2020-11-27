require 'sinatra'

HOME_PAGE = "/index.html"

get '/' do
  redirect HOME_PAGE
end
