Nodo = Struct.new(:value,:next,:prev)

class Listas
    include Enumerable

    def initialize
            @head = nil
            @tail = nil            
    end

    def insertHead(value)
        nodo = Nodo.new(value,nil,nil)
        nodo.next = @head
        nodo.prev = nil
        @head.prev = nodo  if !@head.nil?
        @head = nodo        
        @tail = nodo if @tail.nil?
            
        
    end

    def extractHead
       if (!@head.nil?)
            aux = @head
            @head = aux.next
            @head.prev = nil if !@head.nil?
            aux
       end
    end

    def extractTail
       if (!@tail.nil?)
            aux = @tail
            @tail = aux.prev
            @tail.next = nil if !@tail.nil?
            aux
        end
    end

    def mostrar_lista
        aux = @head
        while (!aux.nil?)            
            puts aux.value
            aux = aux.next
        end
    end

    def each
        aux = @head
        while (!aux.nil?)            
            yield aux.value
            aux=aux.next
        end
                    
    end

      #definición del operador de acceso
    def [] (index)
        aux=@head    
        contador=0
            while ((!aux.nil?)   &&  (contador!= index))
                aux=aux.next
                contador=contador+1
            end
        return nil if aux.nil?
        aux.value

    end
            
end                




  