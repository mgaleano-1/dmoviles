// Definición de la clase Persona
class Persona {
  String nombre;
  int edad;

  Persona(this.nombre, this.edad);

  @override
  String toString() {
    return 'Nombre: $nombre, Edad: $edad';
  }
}

void main() {
  // Creación de una lista de objetos de la clase Persona
  List<Persona> personas = [
    Persona('Alice', 30),
    Persona('Bob', 25),
    Persona('Charlie', 35),
    Persona('Diana', 28),
  ];

  // Imprimir la lista original
  print('Lista original:');
  personas.forEach((persona) => print(persona));

  // Ordenar la lista por la edad de las personas
  personas.sort((a, b) => a.edad.compareTo(b.edad));

  // Imprimir la lista ordenada
  print('\nLista ordenada por edad:');
  personas.forEach((persona) => print(persona));
}
