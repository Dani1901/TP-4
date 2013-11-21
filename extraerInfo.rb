require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'sinatra'
require 'slim'
	
	def extraerInformacion(solicitud)

		codigo_fuente = Nokogiri::HTML(open("http://bandcamp.com/tag/" + solicitud)) #Extraer el codigo fuente de la pagina 
		lista_item = codigo_fuente.css("li[class='item']") #Lista que contiene los items que contienen la informacion de los grupos 
		
		codigo = ""

		for i in 0..9
		
			item = lista_item[i] # Accede con subindice a la informacion de cada grupo

			etiqueta_grupo = item.css("div[class='itemsubtext']").text   #Se accede a la etiqueta que contiene el Nombre y se guarda
			codigo = codigo + '<p>' + etiqueta_grupo + '</p>'
			#puts etiqueta_grupo

			etiqueta_album = item.css("div[class='itemtext']").text #Se accede a la etiqueta que contiene el Nombre del album y se guarda
			codigo = codigo + '<p>' + etiqueta_album+'</p>'			
			#puts etiqueta_album

			etiqueta_url = item.css("a") # Se accede a la etiqueta que contiene el enlace de la informacion del grupo y se guarda
			url = etiqueta_url[0]["href"]
			
			codigo = codigo + '<p>'+'<a href="'+ url +'">VER</a> '+'</p>'
			#puts url

			etiqueta_img = item.css("img[class='art']") # Se accede a la etiqueta que contiene el enlace de la imagen del grupo y se guarda
			imagen = etiqueta_img[0]["src"]
			
			codigo = codigo + '<p>'+'<img src="' + imagen +'"alt="Cover del album">'+'</p>' 
			#puts imagen

			precio(url)	
		
			#puts " "

			
	 
		end
		return codigo
	end


	def precio(url_grupo)
		codigo_fuente = Nokogiri::HTML(open(url_grupo))

		lista_precio = codigo_fuente.css("li[class='buyItem']") #Lista General de compra

		costo = lista_precio.css("span[class='buyItemExtra buyItemNyp secondaryText']").text #Se accede a la etiqueta que contiene la informacion 												de si es o no gratuito 

		if costo.match("or more")	# Si contiene el or more es porque contiene precio 
			etiqueta_moneda = lista_precio.css("span[class='buyItemExtra secondaryText']") #Acceso a la etiqueta del tipo de moneda
			tipo_moneda = etiqueta_moneda[0].text
	
			etiqueta_precio = lista_precio.css("span[class='base-text-color']")#Acceso a la etiqueta de la cantidad de dinero
			precio = etiqueta_precio[0].text

			precio_final = precio + tipo_moneda
		else
			precio_final = "Gratuito"
		end
		puts precio_final
	end

#extraerInformacion("rock")
