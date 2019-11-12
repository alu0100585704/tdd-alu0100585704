require "lib/p6"
RSpec.describe P6 do
  it "has a version number" do
    expect(P6::VERSION).not_to be nil
  end

  describe P6::Alimentos do
    before (:each) do
        @alimento = P6::Alimentos.new("Carne de vaca")
    end
    context "Comprobacion de variables de instancia" do
      it "Nombre de alimento" do
        expect(@alimento.nombre).not_to be nil
      end
    
    end
  end
end
