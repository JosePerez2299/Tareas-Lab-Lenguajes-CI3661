class Circulo
    attr_accessor :radio
  
    def initialize(radio)
      if radio < 0
        raise ArgumentError, 'Radio invalido'
      end
      @radio = radio
    end
  
    def area
      Math::PI * @radio**2
    end
  end
  
  class Cilindro < Circulo
    attr_accessor :altura
  
    def initialize(radio, altura)
      super(radio)
      if altura < 0
        raise ArgumentError, 'Altura invalida'
      end
      @altura = altura
    end
  
    def volumen
      area * @altura
    end
  end
  
  # Ejemplo de uso:
  
  # Crear un círculo
  circulo = Circulo.new(5)
  puts "Área del círculo: #{circulo.area}, radio: #{circulo.radio}"
  
  # Intentar crear un círculo con radio negativo (debería arrojar un error)
  begin
    Circulo.new(-2)
  rescue ArgumentError => e
    puts "Error: #{e.message}"
  end
  
  # Crear un cilindro
  cilindro = Cilindro.new(5, 7)
  puts "Volumen del cilindro: #{cilindro.volumen}"
  
  # Intentar crear un cilindro con radio o altura negativos (debería arrojar un error)
  begin
    Cilindro.new(-2, 4)
  rescue ArgumentError => e
    puts "Error: #{e.message}"
  end
  
  begin
    Cilindro.new(3, -7)
  rescue ArgumentError => e
    puts "Error: #{e.message}"
  end
  