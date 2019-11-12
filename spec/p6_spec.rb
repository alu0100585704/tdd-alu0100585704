require "lib/p6"
RSpec.describe P6 do
  it "has a version number" do
    expect(P6::VERSION).not_to be nil
  end

  describe P6::Alimentos do
    before (:all) do
        @alimento = P6::Alimentos.new("Carne de vaca")
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
        expect(@alimento.valorEnergetico).to eq(112,3)
      end
    end


  end
end
