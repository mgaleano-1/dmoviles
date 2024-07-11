String parOImpar(int numero) {
  if (numero % 2 == 0) {
    return 'par';
  } else {
    return 'impar';
  }
}

void main() {
  // Ejemplos de uso de la función
  int numero1 = 4;
  int numero2 = 12;

  print('$numero1 es ${parOImpar(numero1)}');
  print('$numero2 es ${parOImpar(numero2)}');
}