RSpec.describe TDDALU0100585704 do
  it "has a version number" do
    expect(TDDALU0100585704::VERSION).not_to be nil
  end
  describe Alimentos do
    before (:each) do
      
     #tabla de alimentos composición nutricional  por cada  100g
     # e impacto ambiental por cada kg
    #Nombre - proteinas - cabo hidratos - lipidos- GEI(co2 por kilograma diario) - Terreno m2 año(metros cuadrados por kg por año.)
@tabla = {'Carne de vaca'     => [21.1,0.0,3.1,50.0,164.0],
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

      #defino los ingredientes para  primer plato
      @ingredientesPrimerPlato = Listas.new
      @ingredientesPrimerPlato.insertHead(Alimentos.new("Tofu",@tabla['Tofu'],500))
      @ingredientesPrimerPlato.insertHead(Alimentos.new("Cerveza",@tabla['Cerveza'],250))        

      #defino los ingredientes segundo plato

      @ingredientesSegundoPlato = Listas.new
      @ingredientesSegundoPlato.insertHead(Alimentos.new("Carne de vaca",@tabla['Carne de vaca'],500))
      @ingredientesSegundoPlato.insertHead(Alimentos.new("Huevos",@tabla['Huevos'],200))
      
      #defino los ingredientes postre
      @ingredientesPostre = Listas.new        
      @ingredientesPostre.insertHead(Alimentos.new("Nuez",@tabla['Nuez'],50))

    
                
    end

    context "Pruebas huella nutricional" do

      it "Valores nutricionales Menu 1" do                                 

      #Estos platos son comletos, con información nutricional y ambiental.
      plato1 = PlatoCompleto.new("Primer Plato",@ingredientesPrimerPlato)
      plato2 = PlatoCompleto.new("Segundo Plato",@ingredientesSegundoPlato)
      postre = PlatoCompleto.new("Postre",@ingredientesPostre)

        menu = [plato1,plato2,postre]
        tmp = menu.max
        expect(tmp.nombre_plato).to eq ("Segundo Plato")
        
      end

      it "Precios Menu 1" do         
        plato1 = PlatoCompleto.new("Primer Plato",@ingredientesPrimerPlato)
        plato2 = PlatoCompleto.new("Segundo Plato",@ingredientesSegundoPlato)
        postre = PlatoCompleto.new("Postre",@ingredientesPostre)
                  
        menu = [plato1,plato2,postre]
        precios = [10,15,8]
        precios = precios.map {|x| x*menu.max.hN_plato }
        
                
      end

      it "Valores nutricionales Menu 2" do                         
       @ingredientesPrimerPlato.insertHead(Alimentos.new("Tofu",@tabla['Tofu'],500))

      #Estos platos son comletos, con información nutricional y ambiental.
      plato1 = PlatoCompleto.new("Primer Plato",@ingredientesPrimerPlato)
      plato2 = PlatoCompleto.new("Segundo Plato",@ingredientesSegundoPlato)
      postre = PlatoCompleto.new("Postre",@ingredientesPostre)

        menu = [plato1,plato2,postre]
        tmp = menu.max
        expect(tmp.nombre_plato).to eq ("Primer Plato")
        
      end

      it "Precios Menu 2" do                         
        @ingredientesPrimerPlato.insertHead(Alimentos.new("Tofu",@tabla['Tofu'],500))
        plato1 = PlatoCompleto.new("Primer Plato",@ingredientesPrimerPlato)
        plato2 = PlatoCompleto.new("Segundo Plato",@ingredientesSegundoPlato)
        postre = PlatoCompleto.new("Postre",@ingredientesPostre)
  
        menu = [plato1,plato2,postre]
        precios = [10,15,8]
        precios = precios.map {|x| x*menu.max.hN_plato }                
      end

    end
                  
  end
end

