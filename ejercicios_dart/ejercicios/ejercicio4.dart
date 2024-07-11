// Función para calcular la suma de una lista de enteros
int sumarLista(List<int> lista) {
  int suma = 0;
  
  for (int numero in lista) {
    suma += numero;
  }
  
  return suma;
}

void main() {
  // Uso de la función
  List<int> numeros = [1, 1, 1, 1, 1];
  int resultado = sumarLista(numeros);
  
  print('La suma de los números en la lista es: $resultado');
}
