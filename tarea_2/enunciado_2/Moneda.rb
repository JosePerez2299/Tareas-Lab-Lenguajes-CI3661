# Tasas de conversión Dólar -> otras divisas
$dolar_yen = 146.82
$dolar_euro = 0.91
$dolar_bolivar = 37
$dolar_bitcoin = 0.000026

# Clase para extender la funcionalidad de los números de punto flotante
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

# Clase base para todas las monedas
class Moneda
  attr_accessor :valor

  def initialize(valor)
    @valor = valor
  end

  # Convierte la moneda a otra moneda especificada
  def en(otra_moneda)
    if respond_to?("convertir_a_#{otra_moneda}")
      send("convertir_a_#{otra_moneda}")
    else
      puts "No es posible convertir la Moneda a: #{otra_moneda}"
    end
  end

  # Convierte la moneda a dólares
  def convertir_a_dolares
    raise NotImplementedError, "Método no implementado"
  end

  # Convierte la moneda a yenes
  def convertir_a_yens
    self.convertir_a_dolares.convertir_a_yens
  end

  # Convierte la moneda a euros
  def convertir_a_euros
    self.convertir_a_dolares.convertir_a_euros
  end

  # Convierte la moneda a bolívares
  def convertir_a_bolivares
    self.convertir_a_dolares.convertir_a_bolivares
  end

  # Convierte la moneda a bitcoins
  def convertir_a_bitcoins
    self.convertir_a_dolares.convertir_a_bitcoins
  end

  # Compara dos monedas en términos de dólares
  def comparar(otra_moneda)
    self.convertir_a_dolares.comparar_con_dolares(otra_moneda.convertir_a_dolares)
  end

  # Representación en cadena de la moneda
  def to_s
    "#{@valor} #{self.class}"
  end
end

# Clase para representar Dólares
class Dolar < Moneda
  # Convierte la moneda a dólares (no hace nada)
  def convertir_a_dolares
    self
  end

  # Convierte la moneda a yenes
  def convertir_a_yens
    (@valor * $dolar_yen).round(4).yens
  end

  # Convierte la moneda a euros
  def convertir_a_euros
    (@valor * $dolar_euro).round(4).euros
  end

  # Convierte la moneda a bolívares
  def convertir_a_bolivares
    (@valor * $dolar_bolivar).round(4).bolivares
  end

  # Convierte la moneda a bitcoins
  def convertir_a_bitcoins
    (@valor * $dolar_bitcoin).bitcoins
  end

  # Compara dos cantidades de dólares
  def comparar_con_dolares(otro_dolar)
    if @valor < otro_dolar.valor
      :menor
    elsif @valor > otro_dolar.valor
      :mayor
    else
      :igual
    end
  end
end

# Clase para representar Yenes
class Yen < Moneda
  # Convierte la moneda a yenes (no hace nada)
  def convertir_a_yens
    self
  end

  # Convierte la moneda a dólares
  def convertir_a_dolares
    (@valor / $dolar_yen).round(4).dolares
  end
end

# Clase para representar Euros
class Euro < Moneda
  # Convierte la moneda a euros (no hace nada)
  def convertir_a_euros
    self
  end

  # Convierte la moneda a dólares
  def convertir_a_dolares
    (@valor / $dolar_euro).round(4).dolares
  end
end

# Clase para representar Bolívares
class Bolivar < Moneda
  # Convierte la moneda a bolívares (no hace nada)
  def convertir_a_bolivares
    self
  end

  # Convierte la moneda a dólares
  def convertir_a_dolares
    (@valor / $dolar_bolivar).round(4).dolares
  end
end

# Clase para representar Bitcoins
class Bitcoin < Moneda
  # Convierte la moneda a bitcoins (no hace nada)
  def convertir_a_bitcoins
    self
  end

  # Convierte la moneda a dólares
  def convertir_a_dolares
    (@valor / $dolar_bitcoin).round(4).dolares
  end
end

dolar = Dolar.new(10.0)
yen = Yen.new(1468.2) # 10.0 * $dolar_yen
euro = Euro.new(9.1) # 10.0 / $dolar_euro
bolivar = Bolivar.new(37.0) # 10.0 / $dolar_bolivar
bitcoin = 1.0.bitcoins # 10.0 / $dolar_bitcoin


puts dolar.to_s, bolivar.convertir_a_dolares.to_s