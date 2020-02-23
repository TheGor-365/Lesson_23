#encoding: utf-8
require 'rubygems'
require 'sinatra'
# require 'sinatra/reloader'


get '/' do
	erb "Hello! <a href=\"https://github.com/bootstrap-ruby/sinatra-bootstrap\">Original</a> pattern has been modified for <a href=\"http://rubyschool.us/\">Ruby School</a>"
end

get '/about' do
	erb :about
end

get '/visit' do
	erb :visit
end

get '/contacts' do
	erb :contacts
end

post '/visit' do
	@username = params[:username]
	@phone = params[:phone]
	@date_time = params[:date_time]

	@visiters = File.open 'C:/Users/74955/OneDrive/Рабочий стол/Ruby youtube/Ruby - RP/lessons/lesson22/sinatra-bootstrap/sinatra-bootstrap-clean/public/visiters.txt', 'a'
	@visiters.write "Date and time: #{@date_time}, Visiter name: #{@username} Phone: #{@phone}.\n"
	@visiters.close

	erb :visit
end

post '/contacts' do
	@email = params[:email]

	@contacts = File.open './public/contacts.txt'
	@contacts.write "Email: #{@email},\n Message: #{@message}.\n"
	@contacts.close

	erb :contacts
end
