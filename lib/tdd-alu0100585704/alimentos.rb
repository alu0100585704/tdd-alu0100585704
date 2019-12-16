  class Alimentos

    include Comparable

     attr_reader :nombre, :kgCO_diario, :terreno_anual, :gramos_totales,:proteinas_gramos,:hidratos_gramos,:lipidos_gramos,:hN
     
     

#nobre del alimento, array con valores nutricionales y medioambiantales y gramos
#de alimento, por defecto 100g.
    def  initialize(nombre,valor,g=100)
          
          @nombre = nombre
         
            #si no defino los gramos son 100g, puesto que son en los que
            #se basa la tabla para la información nutricional
            @gramos_totales=g
                          
            @proteinas_gramos=valor[0]*@gramos_totales/100.00
            @hidratos_gramos=valor[1]*@gramos_totales/100.00
            @lipidos_gramos=valor[2]*@gramos_totales/100.00
                 
          #obtengo los gases C02 emitidos diarios en base a la cantidad de alimento en gramos.
          #Recuerda que el valor KGCO2EQ de la tabla es por kg / diario , por eso se divide entre 1000
          @kgCO_diario = valor[3]*@gramos_totales /1000.00

          #impacto ambiental de terreno  m2 al año en base a los gramos.
          #recuerda que el valor de la tabla es para 1 kg, por eso se divide entre 1000
          @terreno_anual = valor[4]*@gramos_totales/1000.00
          @hN = calcular_hN #la huella nutricional, inicialmente a cero.
    end

    #devuelve el valor energético en valores entero. 
    def valorEnergetico
      #kilocalorías por gramo. 4 para proteínas, 4 para hidratos, 9 para lípidos.
      (@proteinas_gramos * 4) + (@hidratos_gramos * 4) + (@lipidos_gramos * 9).to_int
    end
      
    #Calculo el valor Huella nutricional en base al valor energético y a la huella de carbono
    def calcular_hN
      carbono=0
      if @kgCO_diario < 800.00
        carbono =1.00
    
      elsif @kgCO_diario <= 1200.00
        carbono= 2.00
    
      else	
        carbono = 3.00
      end

      valor=valorEnergetico
      calorias=0

      if valor < 670.00
          calorias = 1.00
        elsif valor <=830
          calorias = 2
        else 
          calorias = 3
      end

      (calorias+carbono) /2 #devuelvo media, ese es la que consideramos huella nutricional.
      
      #devuelve impacto bajo valor 1, regular valor 2, alto valor 3
    end

    #mi comparativa de alimentos se hará en base a su valor energético, pero hay que tener en cuenta
    #que el valor energético de dos productos varía dependiendo de la cantidad de gramos del alimento.
    # o sea, para 100 gramos de carne de vaca sus valores energéticos serán lo mismo pero si comparamos
    # 100 g de carne de vaca con 200 gramos de carne de vaca, dará diferente obviamente.
    def <=> (other)
        return nil unless other.instance_of? Alimentos
        valorEnergetico <=> other.valorEnergetico
    end

    def to_s
        "El alimento: #{@nombre}, tiene un valor energetico de #{valorEnergetico} para la cantidad de  #{@gramos_totales} gramos y huella nutricional #{@hN} y #{@kgCO_diario}"        
    end
  
end
