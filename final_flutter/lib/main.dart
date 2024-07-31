import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:math';
import 'package:flutter_slidable/flutter_slidable.dart';

// ==========================
// Clase para representar un Todo
// ==========================
class Todo {
  final int id;
  final String title;
  final bool completed;

  Todo({required this.id, required this.title, required this.completed});

  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
      id: json['id'],
      title: json['title'],
      completed: json['completed'],
    );
  }
}

// Obtener los datos de la API para Todos
Future<List<Todo>> fetchTodos() async {
  final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/todos'));

  if (response.statusCode == 200) {
    List jsonResponse = json.decode(response.body);
    return jsonResponse.map((todo) => Todo.fromJson(todo)).toList();
  } else {
    throw Exception('Failed to load todos');
  }
}

// ==========================
// Clase para representar un Post
// ==========================
class Post {
  final int id;
  final String title;
  final int userId;
  final String body;

  Post({required this.id, required this.title, required this.userId, required this.body});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'],
      title: json['title'],
      userId: json['userId'],
      body: json['body'],
    );
  }
}

// Obtener los datos de la API para Posts
Future<List<Post>> fetchPosts() async {
  final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

  if (response.statusCode == 200) {
    List jsonResponse = json.decode(response.body);
    return jsonResponse.map((post) => Post.fromJson(post)).toList();
  } else {
    throw Exception('Failed to load posts');
  }
}

// ==========================
// Clase para representar un Usuario
// ==========================
class User {
  final int id;
  final String name;
  final String username;
  final String email;
  final String address;

  User({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.address,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      username: json['username'],
      email: json['email'],
      address: json['address']['street'] + ', ' + json['address']['city'],
    );
  }
}

// Obtener los datos del usuario aleatorio
Future<User> fetchUser(int userId) async {
  final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users/$userId'));

  if (response.statusCode == 200) {
    return User.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load user');
  }
}

// Pantalla del ListView
class PostListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Posts')),
      body: FutureBuilder<List<Post>>(
        future: fetchPosts(), // Obtén los posts de la API
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final post = snapshot.data![index];
                return Slidable(
                  key: ValueKey(post.id),
                  startActionPane: ActionPane(
                    motion: DrawerMotion(),
                    children: [
                      SlidableAction(
                        onPressed: (context) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Comentarios para ${post.title}')),
                          );
                        },
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                        icon: Icons.comment,
                        label: 'Comentarios',
                      ),
                      SlidableAction(
                        onPressed: (context) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Post ${post.title} guardado')),
                          );
                        },
                        backgroundColor: Colors.green,
                        foregroundColor: Colors.white,
                        icon: Icons.save,
                        label: 'Guardar',
                      ),
                    ],
                  ),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PostDetailScreen(postId: post.id),
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
                        post.title,
                        style: TextStyle(color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(child: Text("${snapshot.error}"));
          }

          return Center(child: CircularProgressIndicator());
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
        child: Container(
          width: 350,
          height: 350,
          decoration: BoxDecoration(
            color: Colors.grey[800],
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Center(
            child: Text(
              'ID del Post: $postId',
              style: TextStyle(fontSize: 24, color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
      backgroundColor: Colors.black,
    );
  }
}

// Pantalla de perfil del usuario
class ProfileScreen extends StatelessWidget {
  final int userId;

  ProfileScreen({required this.userId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Perfil del Usuario')),
      body: FutureBuilder<User>(
        future: fetchUser(userId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            final user = snapshot.data!;
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('ID: ${user.id}', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  SizedBox(height: 8),
                  Text('Nombre: ${user.name}', style: TextStyle(fontSize: 18)),
                  SizedBox(height: 8),
                  Text('Usuario: ${user.username}', style: TextStyle(fontSize: 18)),
                  SizedBox(height: 8),
                  Text('Email: ${user.email}', style: TextStyle(fontSize: 18)),
                  SizedBox(height: 8),
                  Text('Dirección: ${user.address}', style: TextStyle(fontSize: 18)),
                ],
              ),
            );
          }
          return Center(child: Text('No hay datos disponibles'));
        },
      ),
      backgroundColor: Colors.black,
    );
  }
}

// Pantalla de inicio después del login
class HomeScreen extends StatefulWidget {
  final Future<List<Todo>> todos;

  HomeScreen({Key? key, required this.todos}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  late List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    _pages = [
      PostListScreen(),
      TodoListScreen(todos: widget.todos),
      ProfileScreen(userId: Random().nextInt(10) + 1), // Generar un ID aleatorio entre 1 y 10
    ];
  }

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

// Pantalla del ListView para Todos
class TodoListScreen extends StatelessWidget {
  final Future<List<Todo>> todos;

  TodoListScreen({Key? key, required this.todos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Todos')),
      body: FutureBuilder<List<Todo>>(
        future: todos,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final todo = snapshot.data![index];
                return Slidable(
                  key: ValueKey(todo.id),
                  startActionPane: ActionPane(
                    motion: DrawerMotion(),
                    children: [
                      SlidableAction(
                        onPressed: (context) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Comentarios para ${todo.title}')),
                          );
                        },
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                        icon: Icons.comment,
                        label: 'Comentarios',
                      ),
                      SlidableAction(
                        onPressed: (context) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Todo ${todo.title} guardado')),
                          );
                        },
                        backgroundColor: Colors.green,
                        foregroundColor: Colors.white,
                        icon: Icons.save,
                        label: 'Guardar',
                      ),
                    ],
                  ),
                  child: ListTile(
                    title: Text(todo.title),
                    trailing: Icon(todo.completed ? Icons.check : Icons.close, color: todo.completed ? Colors.green : Colors.red),
                    onTap: () {
                      // Aquí puedes agregar la acción para ver detalles del todo
                    },
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(child: Text("${snapshot.error}"));
          }

          return Center(child: CircularProgressIndicator());
        },
      ),
      backgroundColor: Colors.black,
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
      await Future.delayed(Duration(seconds: 2));
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen(todos: fetchTodos())),
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
                decoration: InputDecoration(labelText: 'Username'),
                validator: (value) => value!.isEmpty ? 'Por favor ingrese su username' : null,
              ),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(labelText: 'Password'),
                obscureText: true,
                validator: (value) => value!.isEmpty ? 'Por favor ingrese su contraseña' : null,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _login,
                child: Text('Login'),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.black,
    );
  }
}

// Punto de entrada de la aplicación
void main() {
  runApp(MyApp());
}

// Clase principal de la aplicación
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Agregar funcionalidad de Deslizar y obtener lista de TODOs',
      theme: ThemeData.dark(),
      home: LoginScreen(),
    );
  }
}
