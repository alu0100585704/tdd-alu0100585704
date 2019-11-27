RSpec.describe P6 do
  it "has a version number" do
    expect(P6::VERSION).not_to be nil
  end
  describe Alimentos do
    before (:all) do
      
     #tabla de alimentos composición nutricional  por cada  100g
     # e impacto ambiental por cada kg
    #Nombre - proteinas - cabo hidratos - lipidos- GEI(co2 por kilograma diario) - Terreno m2 año(metros cuadrados por kg por año.)
@tabla = {'Carne de vaca'          => [21.1,0.0,3.1,50.0,164.0],
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


      #Defino dos alimentos para comparativas y pruebas con ellos.
        @alimento1 = Alimentos.new("Carne de vaca",@tabla['Carne de vaca'],500);
        @alimento2 = Alimentos.new("Lentejas",@tabla['Lentejas'],500);
        @alimento3 = Alimentos.new("Lentejas",@tabla['Lentejas'],200); #igual que alimento 2 pero con 200 gramos en lugar de 500
        
       #defino los ingredientes para dos platos, el español y el vasco. 
        @ingredientesPlatoEspanol = Listas.new
        @ingredientesPlatoEspanol.insertHead(Alimentos.new("Carne de vaca",@tabla['Carne de vaca'],500))
        @ingredientesPlatoEspanol.insertHead(Alimentos.new("Queso",@tabla['Queso'],150))
        @ingredientesPlatoEspanol.insertHead(Alimentos.new("Cerveza",@tabla['Cerveza'],250))        
        @ingredientesPlatoEspanol.insertHead(Alimentos.new("Huevos",@tabla['Huevos'],200))
        @ingredientesPlatoEspanol.insertHead(Alimentos.new("Nuez",@tabla['Nuez'],500))


        @ingredientesPlatoVasco = Listas.new
        @ingredientesPlatoVasco.insertHead(Alimentos.new("Carne de vaca",@tabla['Carne de vaca'],500))
        @ingredientesPlatoVasco.insertHead(Alimentos.new("Queso",@tabla['Queso'],50))
        @ingredientesPlatoVasco.insertHead(Alimentos.new("Cerveza",@tabla['Cerveza'],250))
        @ingredientesPlatoVasco.insertHead(Alimentos.new("Huevos",@tabla['Huevos'],200))
        
        @ingredientesPlatoVegetariano = Listas.new
        @ingredientesPlatoVegetariano.insertHead(Alimentos.new("Tofu",@tabla['Tofu'],500))
        @ingredientesPlatoVegetariano.insertHead(Alimentos.new("Nuez",@tabla['Nuez'],50))
        @ingredientesPlatoVegetariano.insertHead(Alimentos.new("Cafe",@tabla['Cafe'],250))
        @ingredientesPlatoVegetariano.insertHead(Alimentos.new("Lentejas",@tabla['Lentejas'],200))

        @ingredientesPlatoLocuraCarne = Listas.new
        @ingredientesPlatoLocuraCarne.insertHead(Alimentos.new("Carne de vaca",@tabla['Carne de vaca'],400))
        @ingredientesPlatoLocuraCarne.insertHead(Alimentos.new("Carne de coredero",@tabla['Carne de cordero'],50))
        @ingredientesPlatoLocuraCarne.insertHead(Alimentos.new("Cerveza",@tabla['Cerveza'],250))
        @ingredientesPlatoLocuraCarne.insertHead(Alimentos.new("Cerdo",@tabla['Cerdo'],200))

        #defino los platos, español y vasco, en base a las listas de ingredientes anteriores.
        #Estos platos son comletos, con información nutricional y ambiental.
        @platoEspanol = PlatoCompleto.new("Plato Espanol",@ingredientesPlatoEspanol)
        @platoVasco = PlatoCompleto.new("Plato Vasco",@ingredientesPlatoVasco)
        @platoVegetariano = PlatoCompleto.new("Plato Vegetariano",@ingredientesPlatoVegetariano)
        @platoLocuraCarne = PlatoCompleto.new("Plato Locura por la Carne",@ingredientesPlatoLocuraCarne)

        #defino un plato español solo con información nutricional.
        @platoEspanolSoloNutricional = PlatoN.new("Plato Espanol Solo Nutricional",@ingredientesPlatoEspanol)

        
        #defino lista de platos para pruebas de enumeracion de listas de platos.
        @listaPlatos = Listas.new
        @listaPlatos.insertHead(@platoEspanol)
        @listaPlatos.insertHead(@platoVasco)
        @listaPlatos.insertHead(@platoVegetariano)
        @listaPlatos.insertHead(@platoLocuraCarne)

    end
    context "Pruebas informacion nutricional y ambiental entre dos alimentos" do
      it "Valores nutricionales" do                
          expect(@alimento1 != @alimento2).to eq (true)
          expect(@alimento1 == @alimento1).to eq (true)
          expect(@alimento2 > @alimento3).to eq (true)
          expect(@alimento3 < @alimento1).to eq (false)
      end

      it "Valores Ambientales" do                
        expect(@alimento1.kgCO_diario != @alimento2.kgCO_diario).to eq (true)
        expect(@alimento1.terreno_anual == @alimento1.terreno_anual).to eq (true)
      end

      it "Lista de Alimentos" do
        #uso la lista  ingredientes de  plato español para las pruebas de enumeracion y comparacion
        #recuerda que se hacen en base a su valor energético

        tmp=@ingredientesPlatoEspanol.sort
        expect(tmp[0].nombre).to eq("Cerveza")
        expect(tmp[1].nombre).to eq("Huevos")
        expect(tmp.size).to eq(5)

        expect(@ingredientesPlatoEspanol.max.nombre).to eq('Nuez')
        expect(@ingredientesPlatoEspanol.min.nombre).to eq('Cerveza')

      end

    end
    context "Pruebas propiedad" do

      it "Pruebas clase de objeto y pertenencia" do                        
        expect(@platoEspanol.class).to eq(PlatoCompleto)
        expect(@platoEspanol.instance_of? PlatoCompleto).to eq(true)
        expect(@platoEspanol.is_a? PlatoCompleto).to eq(true)
        expect(@platoEspanol.is_a? PlatoN).to eq(true)
      end      

    end
 
    context "Pruebas informacion nutricional y ambiental entre platos" do
      it "Informacion de un plato" do                
        expect(@platoEspanol.nombre_plato).to eq('Plato Espanol')
        #puts @platoEspanol.porcentajeProteinas
        #puts @platoEspanol.porcentajeLipidos
        #puts @platoEspanol.porcentajeHidratos
        #puts @platoEspanol.gramos_total_plato
        expect(@platoEspanol.porcentajeProteinas.to_int).to eq(16)
        expect(@platoEspanol.porcentajeLipidos.to_int).to eq(22)
        expect(@platoEspanol.porcentajeHidratos.to_int).to eq(7)
        #puts @platoEspanol.valorEnergetico
        expect(@platoEspanol.valorEnergetico.to_int).to eq(4766)
        expect(@platoVasco.valorEnergetico.to_int).to eq(1114)
        #puts @platoEspanol.kgCO_diario_plato
        expect(@platoEspanol.kgCO_diario_plato.to_int).to eq(27)
        #puts @platoEspanol.terreno_anual_plato
        expect(@platoEspanol.terreno_anual_plato.to_int).to eq(93)

      end
      it "Comparo objetos diferentes" do
        #puts @platoEspanol == @platoEspanolSoloNutricional
          expect(@platoEspanol == @platoEspanolSoloNutricional).to eq(false)
      end

      it "Comparacion entre platos Valores Nutricionales" do        
          expect(@platoEspanol != @platoLocuraCarne).to eq (true)
          expect(@platoVasco == @platoVasco).to eq (true)
          expect(@platoEspanol > @platoVegetariano).to eq (true)
          expect(@platoVasco < @platoLocuraCarne).to eq (false)
      end

      it "Comparacion entre platos Valores Ambientales" do                
        expect(@platoVasco.kgCO_diario_plato != @platoLocuraCarne.kgCO_diario_plato).to eq (true)
        expect(@platoVegetariano.terreno_anual_plato == @platoVegetariano.terreno_anual_plato).to eq (true)
      end
      it "Lista de  platos" do

        #@listaPlatos.each { |x|
        #  puts x.to_s
        #}
        
        #uso la listaPlatos para las pruebas de enumeracion y comparacion
        #recuerda que se hacen en base a su valor energético del plato
        
        expect(@listaPlatos.max.nombre_plato).to eq ('Plato Espanol')
        expect(@listaPlatos.min.nombre_plato).to eq ('Plato Locura por la Carne')

        tmp = @listaPlatos.sort
        expect(tmp[0].nombre_plato).to eq("Plato Locura por la Carne")
        expect(tmp[1].nombre_plato).to eq("Plato Vasco")
        expect(tmp.size).to eq(4)

      end

    end
        
    
  end
end

