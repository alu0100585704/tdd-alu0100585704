
#heredo de la clase PlatoN y agrego la información medioambiental necesari
class PlatoCompleto < PlatoN
       
    attr_reader :kgCO_diario_plato, :terreno_anual_plato

    #Creo un plato con nombre nombre plato e ingrediente i(que es un objeto de la clase Listas)
    def initialize(plato,i)
        super(plato,i)
        @kgCO_diario_plato=0
        @terreno_anual_plato=0   

        #recorreo todos los ingredientes y voy extrayendo sus datos medioambientales
        @ingredientes.each{|x|            
            @kgCO_diario_plato=@kgCO_diario_plato + x.kgCO_diario
            @terreno_anual_plato=@terreno_anual_plato + x.terreno_anual            
        }

    end

    def <=> (other)
        return nil unless other.instance_of? PlatoCompleto
        valorEnergetico <=> other.valorEnergetico
    end

    def to_s
        puts super
        "Tiene un impacto en emision Gases Invernadero de #{@kgCO_diario_plato} KGCO2eq diarios y terreno anual necesario de #{@terreno_anual_plato} m2"
        
    end
  
end