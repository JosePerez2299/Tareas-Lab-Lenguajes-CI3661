def productoCartesiano(lista1, lista2)
    for x in lista1
        for y in lista2
            yield x, y
        end
    end
end

# Ejemplo de uso
lista1 = [:a, :b, :c]
lista2 = [4, 5]

productoCartesiano(lista1, lista2) do |x, y|
    puts "#{[x, y]}"
end

=begin 
Imprime:
[:a, 4]
[:a, 5]
[:b, 4]
[:b, 5]
[:c, 4]
[:c, 5]
=end