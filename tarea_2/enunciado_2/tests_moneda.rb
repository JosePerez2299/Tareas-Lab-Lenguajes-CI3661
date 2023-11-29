require 'test/unit'
require_relative 'Moneda.rb'

class TestConversorMonedas < Test::Unit::TestCase
  def setup
    @dolar = Dolar.new(10.0)
    @yen = Yen.new(1468.2) # 10.0 * $dolar_yen
    @euro = Euro.new(9.1) # 10.0 / $dolar_euro
    @bolivar = Bolivar.new(370.0) # 10.0 / $dolar_bolivar
    @bitcoin = Bitcoin.new(0.00026) # 10.0 / $dolar_bitcoin
  end

  def test_conversion_a_dolares
    assert_equal(@dolar.to_s, @dolar.convertir_a_dolares.to_s)
    assert_equal(@dolar.to_s, @yen.convertir_a_dolares.to_s)
    assert_equal(@dolar.to_s, @euro.convertir_a_dolares.to_s)
    assert_equal(@dolar.to_s, @bolivar.convertir_a_dolares.to_s)
    assert_equal(@dolar.to_s, @bitcoin.convertir_a_dolares.to_s)
  end

  def test_conversion_a_yens
    assert_equal(@yen.to_s, @dolar.convertir_a_yens.to_s)
    assert_equal(@yen.to_s, @yen.convertir_a_yens.to_s)
    assert_equal(@yen.to_s, @euro.convertir_a_yens.to_s)
    assert_equal(@yen.to_s, @bolivar.convertir_a_yens.to_s)
    assert_equal(@yen.to_s, @bitcoin.convertir_a_yens.to_s)
  end

  def test_conversion_a_euros
    assert_equal(@euro.to_s, @dolar.convertir_a_euros.to_s)
    assert_equal(@euro.to_s, @yen.convertir_a_euros.to_s)
    assert_equal(@euro.to_s, @euro.convertir_a_euros.to_s)
    assert_equal(@euro.to_s, @bolivar.convertir_a_euros.to_s)
    assert_equal(@euro.to_s, @bitcoin.convertir_a_euros.to_s)
  end

  def test_conversion_a_bolivares
    assert_equal(@bolivar.to_s, @dolar.convertir_a_bolivares.to_s)
    assert_equal(@bolivar.to_s, @yen.convertir_a_bolivares.to_s)
    assert_equal(@bolivar.to_s, @euro.convertir_a_bolivares.to_s)
    assert_equal(@bolivar.to_s, @bolivar.convertir_a_bolivares.to_s)
    assert_equal(@bolivar.to_s, @bitcoin.convertir_a_bolivares.to_s)
  end

  def test_conversion_a_bitcoins
    assert_equal(@bitcoin.to_s, @dolar.convertir_a_bitcoins.to_s)
    assert_equal(@bitcoin.to_s, @yen.convertir_a_bitcoins.to_s)
    assert_equal(@bitcoin.to_s, @euro.convertir_a_bitcoins.to_s)
    assert_equal(@bitcoin.to_s, @bolivar.convertir_a_bitcoins.to_s)
    assert_equal(@bitcoin.to_s, @bitcoin.convertir_a_bitcoins.to_s)
  end

  def test_comparar
    dolar_menor = Dolar.new(5.0)
    dolar_mayor = Dolar.new(15.0)
    bitcoin_mayor = 1.0.bitcoins
    

    assert_equal(:igual, @dolar.comparar(@dolar))
    assert_equal(:igual, @dolar.comparar(@bitcoin))
    assert_equal(:menor, @dolar.comparar(bitcoin_mayor))
    assert_equal(:menor, @dolar.comparar(dolar_mayor))
    assert_equal(:mayor, @dolar.comparar(dolar_menor))
  end
end
