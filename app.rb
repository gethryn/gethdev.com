
require 'sinatra'
require 'haml'
require 'pony'

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
    @name = "#{params[:post][:name]}" || 'Not Provided'
    @email = "#{params[:post][:email]}" || 'not@provided.com'
    @issue = "#{params[:post][:issue]}"
    Pony.mail :to => "support@gethdev.com", :from => @email, :subject => "Support Request from #{@name}",
              :cc => @email, :body => @issue unless @issue.is_empty?
    @notice = "Thank you #{@name}, your support request was sent to support@gethdev.com, and CC'd to you at #{@email}"
    haml :support
end
