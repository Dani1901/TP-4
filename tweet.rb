require 'rubygems'
require 'grackle'
require 'json'
require 'highline/import'



$client = Grackle::Client.new(:auth => {
	:type => :oauth,
	:consumer_key => 'TxnvsqOEHdCTlO2CYBIjw',
	:consumer_secret =>  'rVSrmeFq6di9JuOrmQgpzl3zs8or5cpb7Adf8ZA8xHk',
	:token => '2203948560-sfGAMQT69FmSWYrfwuBL2Y3ISyfhB3X3OJ1dyQ2',
	:token_secret => '4xOzJdZtqDE2jxk6vXQ9PVJZsoksewZIWEwuZV8aQ2frG'
	})

class Twitter

	
	@@input = ""
	
	def getJsonData
		@json = $client.users.show? :screen_name => 'LenguajesP' #http://twitter.com/users/show.json?screen_name=LenguajesP
	end
	
	def parseIt
		puts @json.name
		puts @json.location
		puts @json.description
	end
	
	def getTweet
		@@input = ask("Introduzca tweet")
		puts @@input
	end

	def tweet
		
		$client.statuses.update! :status=> @@input #POST to https://twitter.com/statuses/update.json
	end
end
