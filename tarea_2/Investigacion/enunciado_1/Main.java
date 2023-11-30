package tarea_2.Investigacion.enunciado_1;

class A {
}

class B extends A {
}

class Lista<T> {
}

public class Main {
    public static void main(String[] args) {
        Lista<A> listaA = new Lista<>();
        Lista<B> listaB = new Lista<>();

        // Esto no es válido en Java debido a la falta de relación de herencia directa
        Lista<A> listaSuper = listaA; // Error de compilación
    }
}
