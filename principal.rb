require 'rubygems'
require 'sinatra'
require 'slim'

load 'extraerInfo.rb'

get '/Index' do  
	slim :Index
end  
 
post '/' do 
	txt = params[:music]
	extraerInformacion(txt)
end

post '/twt' do
	'hola'
end



