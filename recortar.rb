def recorta(var1)#Metodo para realizar la validacion de los 140 caracteres que permite Twitter
	letra=0
	strResultado=""
	while(letra<140)
		if(letra>var1.length)
			return strResultado
		end
		strResultado+=var1[letra]
		letra+=1
	end
	return strResultado
end
	
