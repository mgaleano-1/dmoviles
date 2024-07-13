// Función para convertir una lista de cadenas de texto a mayúsculas
List<String> convertirAMayusculas(List<String> cadenas) {
  return cadenas.map((cadena) => cadena.toUpperCase()).toList();
}

void main() {
  // Lista de cadenas de texto
  List<String> listaDeCadenas = ['hola', 'mundo', 'programación'];

  // Llamada a la función para convertir a mayúsculas
  List<String> listaMayusculas = convertirAMayusculas(listaDeCadenas);

  // Imprimir la lista original
  print('Lista original: $listaDeCadenas');

  // Imprimir la lista en mayúsculas
  print('Lista en mayúsculas: $listaMayusculas');
}
