import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// Clase para representar un Post
class Post {
  final int id;
  final String title;
  final int userId;
  final String body;

  Post({required this.id, required this.title, required this.userId, required this.body});

  // Método para crear un Post desde JSON
  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'],
      title: json['title'],
      userId: json['userId'],
      body: json['body'],
    );
  }
}

// Función para obtener la lista de posts desde una API
Future<List<Post>> fetchPosts() async {
  final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

  if (response.statusCode == 200) {
    List<dynamic> jsonResponse = json.decode(response.body);
    return jsonResponse.map((post) => Post.fromJson(post)).toList();
  } else {
    throw Exception('Error al cargar los posts');
  }
}

// ==========================
// Ejercicio 2: Acción en los Ítems del ListView
// ==========================

// Pantalla del ListView
class PostListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Posts')),
      body: FutureBuilder<List<Post>>(
        future: fetchPosts(), // Llamada a la función que obtiene los posts
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final posts = snapshot.data!;
            return ListView.builder(
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
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[800],
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      posts[index].title,
                      style: TextStyle(color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
      backgroundColor: Colors.black,
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
          style: TextStyle(fontSize: 24, color: Colors.white),
        ),
      ),
      backgroundColor: Colors.black,
    );
  }
}

// ==========================
// Ejercicio 3: Simulación de Login
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
      theme: ThemeData.dark(),
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
        MaterialPageRoute(builder: (context) => HomeScreen()),
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
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: _login,
                child: Text('Ingresar'),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.black,
    );
  }
}

// Pantalla de inicio después del login
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    PostListScreen(),
    Center(child: Text('TODO', style: TextStyle(color: Colors.white, fontSize: 24))),
    Center(child: Text('PROFILE', style: TextStyle(color: Colors.white, fontSize: 24))),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Inicio')),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.post_add),
            label: 'POST',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'TODOS',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'PROFILE',
          ),
        ],
      ),
      backgroundColor: Colors.black,
    );
  }
}
