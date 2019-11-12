require "p6/version"

module P6
  class Error < StandardError; end
  # Your code goes here...
  class Alimentos
     attr_accessor :nombre, :kgCO, :terreno
     

     #tabla de alimentos composición por kg e impacto ambiental
     #Nombre - proteinas - cabo hidratos - lipidos- GEI - Terreno m2 año

     @@tabla = {'Carne de vaca' => [21.1,0.0,3.1,50.0,164.0],
                'Carne de cordero' => [18.0,0.0,17.0,20.0,185.0],
                'Camarones (piscifactoria)' => [17.6,1.5,0.6,18.0,2.0],
                'Chocolate' =>[5.3,47.0,40.0,2.3,3.4]}

     #kilocalorías por gramo. 4 para proteínas, 4 para hidratos, 9 para lípidos.
     @@kilocalorias_por_gramo = [4.0,4.0,9.0]

    def  initialize(nombre)
      puts 
       if @@tabla[nombre]  !=  nil
          @nombre = nombre
          @kgCO = @@tabla[nombre][3]
          @terreno = @@tabla[nombre][4]
          
       end
    end
    
    def getNombre
      @nombre
    end

    def getKgCO
      @kgCO
    end

    def getTerreno
      @terreno
    end

    #devuelve el valor energético en valores entero. 
    def valorEnergetico
      ((@@tabla[nombre][0] * @@kilocalorias_por_gramo[0]) + (@@tabla[nombre][1] * @@kilocalorias_por_gramo[1]) +(@@tabla[nombre][2] * @@kilocalorias_por_gramo[2])).to_int
    end

    def impactoAmbientalHombre
      valor = 3000/valorEnergetico()
      [valor * kgCO, valor * terreno]
    end

    def impactoAmbientalMujer
      valor = 2300/valorEnergetico()
      [valor * kgCO, valor * terreno]
    end
  end

end
