RSpec.describe P6 do
  it "has a version number" do
    expect(P6::VERSION).not_to be nil
  end

  describe Alimentos do
    before (:all) do
        @alimento = Alimentos.new("Carne de vaca")
    end
    context "Comprobacion de variables de instancia" do
      it "Nombre de alimento" do
        expect(@alimento.nombre).not_to be nil        
      end

      it "kgCO2 eq" do
        expect(@alimento.kgCO).not_to be nil        
      end
      it "Terreno empleado" do
        expect(@alimento.terreno).not_to be nil        
      end
      
    end
    context "Comprobación de métodos" do
      it "Método para obtener nombre de alimento" do
         expect(@alimento.getNombre).to eq(@alimento.nombre)  
      end

      it "Método para obtener emisiones de gases efecto invernadero" do
        expect(@alimento.getKgCO).to eq(@alimento.kgCO)  
     end

     it "Método para obtener terreno utilizado" do
      expect(@alimento.getTerreno).to eq(@alimento.terreno)  
    end

    end

    context "Métodos que requieren variables" do
      
      it "Método para obtener el valor energético por kilogramo Carne de vaca" do
        tipo_de_alimento = Alimentos.new("Carne de vaca")
        expect(tipo_de_alimento.valorEnergetico).to eq(112)
      end

      it "Método para obtener el valor energético por kilogramo Carne de cordero" do
        tipo_de_alimento = Alimentos.new("Carne de cordero")
        expect(tipo_de_alimento.valorEnergetico).to eq(225)
      end

      it "Método para obtener el valor energético por kilogramo Camarones(piscifactoria)" do
        tipo_de_alimento = Alimentos.new("Camarones (piscifactoria)")
        expect(tipo_de_alimento.valorEnergetico).to eq(81)
      end

      it "Método para obtener el valor energético por kilogramo Chocolate" do
        tipo_de_alimento = Alimentos.new("Chocolate")
        expect(tipo_de_alimento.valorEnergetico).to eq(569)
      end
    end

    context "Métodos Impacto ambiental" do
      it "Hombre de 20 - 39  años" do
          expect(@alimento.impactoAmbientalHombre).to eq([1300,4264])          
      end

      it "Mujer de 20 - 39  años" do
        expect(@alimento.impactoAmbientalMujer).to eq([1000,3280])         
      end

    end

  end

end
