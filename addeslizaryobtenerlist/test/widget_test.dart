import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:agregar_funcionalidad_deslizar_y_obtener_lista_de_todos/main.dart';

void main() {
  testWidgets('Verificar que la pantalla de inicio se carga y la lista de TODOs se muestra', (WidgetTester tester) async {
    // Construir nuestra aplicación y activar un frame.
    await tester.pumpWidget(MyApp());

    // Verificar que la pantalla de inicio muestra el texto 'Login'.
    expect(find.text('Login'), findsOneWidget);

    // Completar el formulario de inicio de sesión.
    await tester.enterText(find.byType(TextFormField).first, 'usuario');
    await tester.enterText(find.byType(TextFormField).last, 'contraseña');
    await tester.tap(find.text('Ingresar'));
    await tester.pumpAndSettle(); // Esperar a que la navegación se complete.

    // Verificar que la pantalla de inicio muestra la lista de TODOs.
    expect(find.text('TODOs'), findsOneWidget);
    expect(find.text('Comentarios'), findsOneWidget); // Verificar el botón deslizable de comentarios.
    expect(find.text('Guardar'), findsOneWidget); // Verificar el botón deslizable de guardar.
  });
}
