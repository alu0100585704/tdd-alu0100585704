class PlatoN
    include Comparable
       
    attr_reader :ingredientes, :nombre_plato, :gramos_total_plato,:proteinas_gramos_plato,:hidratos_gramos_plato,:lipidos_gramos_plato

    #Creo un plato con nombre nombre plato e ingrediente i(que es un objeto de la clase Listas)
    def initialize(plato,i)
        @nombre_plato =  plato
        @ingredientes = i
        @gramos_total_plato=0
        @proteinas_gramos_plato=0
        @hidratos_gramos_plato=0
        @lipidos_gramos_plato=0        

        #recorreo todos los ingredientes y voy extrayendo sus datos nutricionales
        @ingredientes.each{|x|            
            @gramos_total_plato=@gramos_total_plato + x.gramos_totales 
            @proteinas_gramos_plato=@proteinas_gramos_plato + x.proteinas_gramos
            @hidratos_gramos_plato=@hidratos_gramos_plato + x.hidratos_gramos
            @lipidos_gramos_plato=@lipidos_gramos_plato + x.lipidos_gramos            

        }

    end

    def <=> (other)
        return nil unless other.instance_of? PlatoN
        valorEnergetico <=> other.valorEnergetico
    end

    #devuelve el valor energético en valores entero de todo el plato
    def valorEnergetico
            #kilocalorías por gramo. 4 para proteínas, 4 para hidratos, 9 para lípidos.
       (@proteinas_gramos_plato * 4) + (@hidratos_gramos_plato * 4) + (@lipidos_gramos_plato * 9).to_int
    end
        

    #metos para devolver los porcentajes de los diferentes nutrientes en proporcial al total del plato

    def porcentajeProteinas
        @proteinas_gramos_plato * 100 / @gramos_total_plato
    end

        
    def porcentajeHidratos
        @hidratos_gramos_plato * 100 / @gramos_total_plato
    end

            
    def porcentajeLipidos
        @lipidos_gramos_plato * 100 / @gramos_total_plato
    end


    def to_s
        "El plato: #{@nombre_plato} tiene un valor energetico de #{valorEnergetico} Kilocalorias para la cantidad de  #{@gramos_total_plato} gramos"
    end
  
end