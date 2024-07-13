import 'package:flutter/material.dart';

// ==========================
// Ejercicio 1: ListView con una Lista Fija
// Descripción: Crear un ListView que muestre una lista fija de elementos.
// ==========================

// Clase para representar un Post
class Post {
  final int id;
  final String title;
  final int userId;
  final String body;

  Post({required this.id, required this.title, required this.userId, required this.body});
}

// Crear una lista fija de objetos Post.
final List<Post> posts = [
  Post(id: 1, title: 'sunt aut facere repellat provident occaecati excepturi optio reprehenderit', userId: 1, body: 'quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto'),
  Post(id: 2, title: 'qui est esse', userId: 1, body: 'est rerum tempore vitae\nsequi sint nihil reprehenderit dolor beatae ea dolores neque\nfugiat blanditiis voluptate porro vel nihil molestiae ut reiciendis\nqui aperiam non debitis possimus qui neque nisi nulla'),
  Post(id: 3, title: 'ea molestias quasi exercitationem repellat qui ipsa sit aut', userId: 1, body: 'et iusto sed quo iure\nvoluptatem occaecati omnis eligendi aut ad\nvoluptatem doloribus vel accusantium quis pariatur\nmolestiae porro eius odio et labore et velit aut'),
  Post(id: 4, title: 'eum et est occaecati', userId: 1, body: 'ullam et saepe reiciendis voluptatem adipisci\nsit amet autem assumenda provident rerum culpa\nquis hic commodi nesciunt rem tenetur doloremque ipsam iure\nquis sunt voluptatem rerum illo velit'),
  Post(id: 5, title: 'nesciunt quas odio', userId: 1, body: 'repudiandae veniam quaerat sunt sed\nalias aut fugiat sit autem sed est\nvoluptatem omnis possimus esse voluptatibus quis\nest aut tenetur dolor neque'),
  Post(id: 6, title: 'sunt aut facere repellat provident occaecati excepturi optio reprehenderit', userId: 1, body: 'quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto'),
  Post(id: 7, title: 'qui est esse', userId: 1, body: 'est rerum tempore vitae\nsequi sint nihil reprehenderit dolor beatae ea dolores neque\nfugiat blanditiis voluptate porro vel nihil molestiae ut reiciendis\nqui aperiam non debitis possimus qui neque nisi nulla'),
  Post(id: 8, title: 'ea molestias quasi exercitationem repellat qui ipsa sit aut', userId: 1, body: 'et iusto sed quo iure\nvoluptatem occaecati omnis eligendi aut ad\nvoluptatem doloribus vel accusantium quis pariatur\nmolestiae porro eius odio et labore et velit aut'),
  Post(id: 9, title: 'eum et est occaecati', userId: 1, body: 'ullam et saepe reiciendis voluptatem adipisci\nsit amet autem assumenda provident rerum culpa\nquis hic commodi nesciunt rem tenetur doloremque ipsam iure\nquis sunt voluptatem rerum illo velit'),
  Post(id: 10, title: 'nesciunt quas odio', userId: 1, body: 'repudiandae veniam quaerat sunt sed\nalias aut fugiat sit autem sed est\nvoluptatem omnis possimus esse voluptatibus quis\nest aut tenetur dolor neque'),
];

// ==========================
// Ejercicio 2: Acción en los Ítems del ListView
// Descripción: Agregar un botón o la acción de onTap a cada ítem de la lista que muestre un nuevo screen con el id del post en el centro.
// ==========================

// Pantalla del ListView
class PostListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Posts')),
      body: ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PostDetailScreen(postId: posts[index].id),
                ),
              );
            },
            child: ListTile(
              title: Text(posts[index].title),
            ),
          );
        },
      ),
    );
  }
}

// Pantalla de detalles del Post
class PostDetailScreen extends StatelessWidget {
  final int postId;

  PostDetailScreen({required this.postId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Post Detalle')),
      body: Center(
        child: Text(
          'ID del Post: $postId',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

// ==========================
// Ejercicio 3: Simulación de Login
// Descripción: Crear un screen con dos inputs y un botón de ingresar que mande al ListView.
// ==========================

// Pantalla principal
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simulación de Login',
      home: LoginScreen(),
    );
  }
}

// Pantalla de Login
class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _login() async {
    if (_formKey.currentState!.validate()) {
      // Bloquear la interfaz por 2 segundos
      await Future.delayed(Duration(seconds: 2));
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => PostListScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _usernameController,
                decoration: InputDecoration(labelText: 'Usuario'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese su usuario';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(labelText: 'Contraseña'),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese su contraseña';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _login,
                child: Text('Ingresar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
