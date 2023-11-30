class A
class B extends A

class Lista[+T]

object Main extends App {
  val listaA: Lista[A] = new Lista[A]
  val listaB: Lista[B] = new Lista[B]

  val listaSuper: Lista[A] = listaB // Esto es válido en Scala debido a la covarianza
  
  println("Fin")
}
