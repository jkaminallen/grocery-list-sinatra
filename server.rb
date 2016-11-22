require 'sinatra'
require 'csv'

get '/' do
  redirect 'groceries'
end

get '/groceries' do
  @list_items = CSV.open("grocery_list.csv", headers: true)
  erb :index
end

post '/groceries' do
  @groc = params["name"]

  unless @groc.strip.empty?
    CSV.open("grocery_list.csv", 'a') do |items|
      items << [@groc]
    end
  end
  redirect '/groceries'
end  
