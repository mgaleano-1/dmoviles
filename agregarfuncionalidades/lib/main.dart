import 'package:flutter/material.dart';

// ==========================
// Ejercicio 1: ListView con una Lista Fija
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
// Crear una lista fija de objetos Post.
final List<Post> posts = [
  Post(id: 1, title: '1. sunt aut facere repellat provident occaecati excepturi optio reprehenderit', userId: 1, body: 'quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto'),
  Post(id: 2, title: '2. qui est esse', userId: 1, body: 'est rerum tempore vitae\nsequi sint nihil reprehenderit dolor beatae ea dolores neque\nfugiat blanditiis voluptate porro vel nihil molestiae ut reiciendis\nqui aperiam non debitis possimus qui neque nisi nulla'),
  Post(id: 3, title: '3. ea molestias quasi exercitationem repellat qui ipsa sit aut', userId: 1, body: 'et iusto sed quo iure\nvoluptatem occaecati omnis eligendi aut ad\nvoluptatem doloribus vel accusantium quis pariatur\nmolestiae porro eius odio et labore et velit aut'),
  Post(id: 4, title: '4. eum et est occaecati', userId: 1, body: 'ullam et saepe reiciendis voluptatem adipisci\nsit amet autem assumenda provident rerum culpa\nquis hic commodi nesciunt rem tenetur doloremque ipsam iure\nquis sunt voluptatem rerum illo velit'),
  Post(id: 5, title: '5. nesciunt quas odio', userId: 1, body: 'repudiandae veniam quaerat sunt sed\nalias aut fugiat sit autem sed est\nvoluptatem omnis possimus esse voluptatibus quis\nest aut tenetur dolor neque'),
  Post(id: 6, title: '6. sunt aut facere repellat provident occaecati excepturi optio reprehenderit', userId: 1, body: 'quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto'),
  Post(id: 7, title: '7. qui est esse', userId: 1, body: 'est rerum tempore vitae\nsequi sint nihil reprehenderit dolor beatae ea dolores neque\nfugiat blanditiis voluptate porro vel nihil molestiae ut reiciendis\nqui aperiam non debitis possimus qui neque nisi nulla'),
  Post(id: 8, title: '8. ea molestias quasi exercitationem repellat qui ipsa sit aut', userId: 1, body: 'et iusto sed quo iure\nvoluptatem occaecati omnis eligendi aut ad\nvoluptatem doloribus vel accusantium quis pariatur\nmolestiae porro eius odio et labore et velit aut'),
  Post(id: 9, title: '9. eum et est occaecati', userId: 1, body: 'ullam et saepe reiciendis voluptatem adipisci\nsit amet autem assumenda provident rerum culpa\nquis hic commodi nesciunt rem tenetur doloremque ipsam iure\nquis sunt voluptatem rerum illo velit'),
  Post(id: 10, title: '10. nesciunt quas odio', userId: 1, body: 'repudiandae veniam quaerat sunt sed\nalias aut fugiat sit autem sed est\nvoluptatem omnis possimus esse voluptatibus quis\nest aut tenetur dolor neque'),
  Post(id: 11, title: '11. distinctio vitae autem nihil ut molestias quo', userId: 1, body: 'et itaque necessitatibus maxime molestiae qui quas velit\nut aliquid earum ad in dolorem\ndolores omnis soluta totam'),
  Post(id: 12, title: '12. natus nisi omnis corporis facere molestiae rerum in', userId: 1, body: 'nisi aut doloremque soluta velit\ndolorem facere sint soluta expedita\nreiciendis consectetur velit'),
  Post(id: 13, title: '13. accusamus eos facilis sint et aut voluptatem', userId: 1, body: 'ab sit a omnis eos\nsoluta neque rerum exercitationem\nveniam occaecati quis'),
  Post(id: 14, title: '14. quo laboriosam deleniti aut qui', userId: 1, body: 'doloribus est atque dignissimos porro\nnesciunt debitis eos ut\nquia asperiores est et'),
  Post(id: 15, title: '15. dolores suscipit mollitia', userId: 1, body: 'consequatur pariatur est eos\nqui voluptatem dolores voluptate\nquia voluptate nobis'),
  Post(id: 16, title: '16. quo deleniti praesentium dicta non quod', userId: 1, body: 'voluptatem quasi sunt laboriosam\ndolorum et occaecati et\nquisquam est illum'),
  Post(id: 17, title: '17. quasi nulla vero fugit delectus', userId: 1, body: 'eos voluptatibus suscipit est\nad est aliquid rerum\ndolores quasi veritatis'),
  Post(id: 18, title: '18. sit consequatur vel aliquam', userId: 1, body: 'voluptatem est soluta aliquam\nrepudiandae voluptatum enim\nvoluptatem quibusdam expedita'),
  Post(id: 19, title: '19. qui exercitationem consectetur', userId: 1, body: 'facilis et nostrum\nnemo magni est mollitia incidunt tenetur dolor'),
  Post(id: 20, title: '20. omnis iure dignissimos', userId: 1, body: 'odio minus maiores atque in\nquae quidem optio eos nihil eum'),
];

// ==========================
// Ejercicio 2: Acción en los Ítems del ListView
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
