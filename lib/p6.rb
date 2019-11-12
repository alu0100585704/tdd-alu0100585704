require "p6/version"

module P6
  class Error < StandardError; end
  # Your code goes here...
  class Alimentos
     attr_accessor :nombre, :kgCO, :terreno
     

     #tabla de alimentos composición por kg e impacto ambiental
     #Nombre - proteinas - cabo hidratos - lipidos- GEI - Terreno m2 año

     @@tabla = {'Carne de vaca' => [21.1,0.0,3.1,50.0,164.0],'Carne de cordero' => [18.0,0.0,17.0,20.0,185.0],'Camarones(piscifactoria)' => [17.6,1.5,0.6,18.0,2.0],'Chocolate' =>[5.3,47.0,40.0,2.3,3.4]}
    def  initialize(nombre)
      puts 
       if @@tabla[nombre]  !=  nil
          @nombre = nombre
          @kgCO = @@tabla[nombre][3]
          @terreno = @@tabla[nombre][4]
          
       end
    end
  end

end
