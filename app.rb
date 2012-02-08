
require 'sinatra'
require 'haml'


get '/' do
	haml :index
end

get '/iphone/erlang' do
  haml :erlang_iphone
end

get '/excel/forecast' do
  haml :forecast
end

get '/excel/shrinkage' do
  haml :shrinkage
end

get '/excel/erlang' do
  haml :erlang_excel
end

