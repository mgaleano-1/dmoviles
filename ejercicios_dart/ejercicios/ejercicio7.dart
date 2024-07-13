// Función para convertir grados Celsius a Fahrenheit
double convertirCelsiusAFahrenheit(double celsius) {
  return (celsius * 9 / 5) + 32;
}

void main() {
  // Grados Celsius a convertir
  double celsius = 30.0;

  // Llamada a la función para convertir a Fahrenheit
  double fahrenheit = convertirCelsiusAFahrenheit(celsius);

  // Imprimir el resultado
  print('$celsius grados Celsius son $fahrenheit grados Fahrenheit');
}
