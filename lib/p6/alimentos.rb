  class Alimentos
     attr_accessor :nombre, :kgCO, :terreno
     

     #tabla de alimentos composición por kg e impacto ambiental
     #Nombre - proteinas - cabo hidratos - lipidos- GEI - Terreno m2 año

     @@tabla = {'Carne de vaca'             => [21.1,0.0,3.1,50.0,164.0],
                'Carne de cordero'          => [18.0,0.0,17.0,20.0,185.0],
                'Camarones (piscifactoria)' => [17.6,1.5,0.6,18.0,2.0],
                'Chocolate'                 =>[5.3,47.0,40.0,2.3,3.4],
                'Salmon (piscifactoria)'    => [19.9,0.0,13.6,6.0,3.7],
                'Cerdo'                     => [21.5,0.0,6.3,7.6,11.0],
                'Pollo'                     => [20.6,0.0,5.6,5.7,7.1],
                'Queso'                     => [25.0,1.3,33.0,11.0,41.0],
                'Cerveza'                   => [0.5,3.6,0.0,0.24,0.22],
                'Leche de vaca'             => [3.3,4.8,3.2,3.2,8.9],
                'Huevos'                    => [13.0,1.1,11.0,4.2,5.7],
                'Cafe'                      => [0.1,0.0,0.0,0.4,0.3],
                'Tofu'                      => [8.0,1.9,4.8,2.0,2.2],
                'Lentejas'                  => [23.5,52.0,1.4,0.4,3.4],
                'Nuez'                      => [20.0,21.0,54.0,0.3,7.9]
              }

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
