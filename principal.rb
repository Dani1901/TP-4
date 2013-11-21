require 'rubygems'
require 'sinatra'
require 'slim'

load 'extraerInfo.rb'
load 'tweet.rb'

get '/Index' do  
	slim :Index
end  
 
post '/' do 
	codigo_HTML = params[:music]
	
	if codigo_HTML ==""
		"<h3>No ha insertado nada</h3>"
	else
		extraerInformacion(codigo_HTML)
	end
	
end

post '/twt0' do
	tweet1 = @@informacion[0]
	t = Twitter.new
	recorta(tweet1)
	t.tweet(tweet1)
	"<h1><a href = 'http://www.twitter.com'>Twitter</a></h1>"
end

post '/twt1' do
	tweet2 = @@informacion[1]
	t = Twitter.new
	recorta(tweet2)
	t.tweet(tweet2)
	"<h1><a href = 'http://www.twitter.com'>Twitter</a></h1>"
end

post '/twt2' do
	tweet3 = @@informacion[2]
	t = Twitter.new
	recorta(tweet3)
	t.tweet(tweet3)
	"<h1><a href = 'http://www.twitter.com'>Twitter</a></h1>"
end

post '/twt3' do
	tweet4 = @@informacion[3]
	t = Twitter.new
	recorta(tweet4)
	t.tweet(tweet4)
	"<h1><a href = 'http://www.twitter.com'>Twitter</a></h1>"
end

post '/twt4' do
	tweet5 = @@informacion[4]
	t = Twitter.new
	recorta(tweet5)
	t.tweet(tweet5)
	"<h1><a href = 'http://www.twitter.com'>Twitter</a></h1>"
end

post '/twt5' do
	tweet6 = @@informacion[5]
	t = Twitter.new
	recorta(tweet6)
	t.tweet(tweet6)
	"<h1><a href = 'http://www.twitter.com'>Twitter</a></h1>"
end

post '/twt6' do
	tweet7 = @@informacion[6]
	t = Twitter.new
	recorta(tweet7)
	t.tweet(tweet7)
	"<h1><a href = 'http://www.twitter.com'>Twitter</a></h1>"
end

post '/twt7' do
	tweet8 = @@informacion[7]
	t = Twitter.new
	recorta(tweet8)
	t.tweet(tweet8)
	"<h1><a href = 'http://www.twitter.com'>Twitter</a></h1>"
end

post '/twt8' do
	tweet9 = @@informacion[8]
	t = Twitter.new
	recorta(tweet9)
	t.tweet(tweet9)
	"<h1><a href = 'http://www.twitter.com'>Twitter</a></h1>"
end

post '/twt9' do
	tweet10 = @@informacion[9]
	t = Twitter.new
	recorta(tweet10)	
	t.tweet(tweet10)
	"<h1><a href = 'http://www.twitter.com'>Twitter</a></h1>"
end
