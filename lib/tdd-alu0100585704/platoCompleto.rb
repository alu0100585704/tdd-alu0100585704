
#heredo de la clase PlatoN y agrego la información medioambiental necesari
class PlatoCompleto < PlatoN
       
    attr_reader :kgCO_diario_plato, :terreno_anual_plato,:hN_plato

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
        @hN_plato=calcular_hN_plato
    end

#    def <=> (other)
#        return nil unless other.instance_of? PlatoCompleto
#        valorEnergetico <=> other.valorEnergetico
#    end
      #
      # Ahora comparo platos por huella nutricional y no por valor energético
      #
    def <=> (other)
        return nil unless other.instance_of? PlatoCompleto
        @hN_plato <=> other.hN_plato
    end

    #Calculo el valor Huella nutricional en base al valor energético y a la huella de carbono
    def calcular_hN_plato
        carbono=0
        if @kgCO_diario_plato < 800.00
          carbono =1.00
      
        elsif @kgCO_diario_plato <= 1200.00
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

    def to_s
        puts super
        "Tiene un impacto en emision Gases Invernadero de #{@kgCO_diario_plato} KGCO2eq diarios y terreno anual necesario de #{@terreno_anual_plato} m2 y huella nutricional #{@hN_plato}"
        
    end
  
end