// Función para invertir una cadena de texto
String invertirCadena(String cadena) {
  return cadena.split('').reversed.join('');
}

void main() {
  // Cadena de texto a invertir
  String texto = 'Manu';

  // Llamada a la función para invertir la cadena
  String textoInvertido = invertirCadena(texto);

  // Imprimir el resultado
  print('La cadena original es: $texto');
  print('La cadena invertida es: $textoInvertido');
}
