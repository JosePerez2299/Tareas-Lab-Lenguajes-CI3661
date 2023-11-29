# Tasas de conversion Dolar -> otras divisas
$dolar_yen = 146.82
$dolar_euro = 0.91
$dolar_bolivar = 37
$dolar_bitcoin = 0.000026

class Float
    def dolares
        Dolar.new(self) 
    end

    def yens
        Yen.new(self) 
    end

    def euros
        Euro.new(self) 
    end

    def bolivares
        Bolivar.new(self) 
    end

    def bitcoins
        Bitcoin.new(self) 
    end
end

class Moneda
    attr_accessor :valor

    def initialize(valor)
        @valor = valor
    end

    def en(otra_moneda)
        if respond_to?("convertir_a_#{otra_moneda}")
            send("convertir_a_#{otra_moneda}")
          else
            puts "No es posible convertir la Moneda a: #{otra_moneda}"
          end
    end

    def convertir_a_dolares
        raise NotImplementedError, "Método no implementado"
    end

    def convertir_a_yens  
        self.convertir_a_dolares.convertir_a_yens
    end

    def convertir_a_euros
        self.convertir_a_dolares.convertir_a_euros
    end

    def convertir_a_bolivares
        self.convertir_a_dolares.convertir_a_bolivares
    end

    def convertir_a_bitcoins
        self.convertir_a_dolares.convertir_a_bitcoins
    end

    def comparar(otraMoneda)
        self.convertir_a_dolares.comparar_con_dolares(otraMoneda.convertir_a_dolares)
    end

    def to_s
        "#{@valor} #{self.class}"
    end

end

class Dolar < Moneda
    def convertir_a_dolares
        self
    end
    def convertir_a_yens
        (@valor * $dolar_yen).round(4).yens
    end

    def convertir_a_euros
       (@valor * $dolar_euro).round(4).euros
    end

    def convertir_a_bolivares
        (@valor * $dolar_bolivar).round(4).bolivares
    end

    def convertir_a_bitcoins
        (@valor * $dolar_bitcoin).bitcoins
    end

    def comparar_con_dolares(otroDolar)
        if @valor < otroDolar.valor
            :menor
        elsif @valor > otroDolar.valor
            :mayor
        else 
            :igual
        end

    end

end


class Yen < Moneda
    def convertir_a_yens
        self
    end

    def convertir_a_dolares
        (@valor / $dolar_yen).round(4).dolares
    end
end

class Euro < Moneda

    def convertir_a_euros
      self
    end

    def convertir_a_dolares
        (@valor / 0.91).round(4).dolares
    end
end

class Bolivar < Moneda
    def convertir_a_bolivares
        self
    end

    def convertir_a_dolares
        (@valor / $dolar_bolivar).round(4).dolares
    end
end

class Bitcoin < Moneda
    def convertir_a_bitcoins
        self
    end

    def convertir_a_dolares
        (@valor / $dolar_bitcoin).round(4).dolares
    end
end



x = 10.0.dolares

puts "Para #{x}"
x = x.en(:dolares)
y =  x.en(:yens)
z =  x.en(:bitcoins)
w =  x.en(:bolivares)
u =  x.en(:euros)
puts x, y, z, w, u

puts "\nPara #{y}"
x = [y.en(:dolares), y.en(:yens), y.en(:bitcoins), y.en(:bolivares), y.en(:euros)]
puts x

# Continúa realizando más pruebas según tus necesidades
