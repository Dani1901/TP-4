require 'rubygems'
require 'grackle'
require 'json'
require 'highline/import'

#Se tomo como guía para realizar la conexion de la aplicación, las instrucciones que se encuentran en https://github.com/hayesdavis/grackle.
# Grackle es una libreria liviana para realizar conexion con el API de Twitter, para más información, acceder al link anterior

$client = Grackle::Client.new(:auth => { 
	:type => :oauth,#Oauth es un protocolo de seguridad que le permite a la aplicación, comportarse con derechos de usuario, sin hacer uso de la clave.	
	:consumer_key => 'TxnvsqOEHdCTlO2CYBIjw',	#Se definen las claves de usuario para conectar a la aplicación
	:consumer_secret =>  'rVSrmeFq6di9JuOrmQgpzl3zs8or5cpb7Adf8ZA8xHk',
	:token => '2203948560-sfGAMQT69FmSWYrfwuBL2Y3ISyfhB3X3OJ1dyQ2',	#Clave para realizar conexion del token
	:token_secret => '4xOzJdZtqDE2jxk6vXQ9PVJZsoksewZIWEwuZV8aQ2frG'
	})

class Twitter

	
	@@input = ""
	
	def getJsonData #Metodo para obtener información de twitter       (link)
		@json = $client.users.show? :screen_name => 'LenguajesP' #http://twitter.com/users/show.json?screen_name=LenguajesP
	end
	
	def parseIt #Metodo para parsear datos espcíficos de los obtenidos en getJsonData (De ejemplo)
		puts @json.name
		puts @json.location
		puts @json.description
	end
	
	def getTweet #Metodo para pedirle al usuario el tweet que desea publicar
		@@input = ask("Introduzca tweet")
		puts @@input
	end

	def tweet(input1)#Metodo para realizar el tweet, actualizando el status mediante json.
		
		$client.statuses.update! :status=> input1 #POST to https://twitter.com/statuses/update.json
	end
end
