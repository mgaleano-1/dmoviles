// Definición de la clase Persona
class Persona {
  String nombre;
  int edad;


  // Constructor de la clase Persona
  Persona(this.nombre, this.edad);

  // Método para imprimir una descripción de la persona
  void imprimirDescripcion() {
    print('Nombre: $nombre, Edad: $edad años');
  }
}

void main() {
  // Creación de objetos de la clase Persona
  Persona persona1 = Persona('edu', 25);
  Persona persona2 = Persona('María', 20);

  // Llamada al método para imprimir la descripción de la persona
  persona1.imprimirDescripcion();
  persona2.imprimirDescripcion();
}
