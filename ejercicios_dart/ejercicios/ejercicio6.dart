// Función para calcular el factorial de un número
int calcularFactorial(int numero) {
  if (numero <= 1) {
    return 1;
  } else {
    return numero * calcularFactorial(numero - 1);
  }
}

void main() {
  // Número del cual se desea calcular el factorial
  int numero = 3;

  // Llamada a la función para calcular el factorial
  int resultado = calcularFactorial(numero);

  // Imprimir el resultado
  print('El factorial de $numero es: $resultado');
}
