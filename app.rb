
require 'sinatra'
require 'haml'

# set UTF-8 for outgoing
before do
  headers "Content-Type" => "text/html; charset=utf8"
end

get '/' do
  @title = "Welcome to gethdev.com"
	haml :index
end

get '/iphone/erlang' do
  @title = "gethdev.com - ErlangC v1.1 for iPhone"
  haml :erlang_iphone
end

get '/excel/erlang' do
  @title = "gethdev.com - Performing ErlangC Calculations in Excel"
  haml :erlang_excel
end

get '/support' do
  @title = "gethdev.com Support"
  haml :support
end

post '/support' do
    @name = "#{params[:post][:name]}"
    @email = "#{params[:post][:email]}"
    @issue = "#{params[:post][:issue]}"
    haml :support
end
