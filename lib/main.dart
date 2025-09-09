import 'package:flutter/material.dart';
import 'a.dart';
import 'b.dart';
import 'c.dart';
import 'rps_game.dart';


void main() => runApp(MaterialApp(
  theme: ThemeData.dark(),
  debugShowCheckedModeBanner: false,
  home: const HomeScreen(),
));

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Practica 4')),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Menú de navegación',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.book),
              title: const Text('Practica 2'),
              onTap: () {
                Navigator.pop(context); // Cierra el drawer
                Navigator.push(context, MaterialPageRoute(builder: (_) => pantalla1()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.school),
              title: const Text('Practica 3'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (_) => pantalla2()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.person_add),
              title: const Text('Registro'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (_) => const RegistrationScreen()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.sports_esports),
              title: const Text('Juego RPS'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (_) => const RpsGame()));
              },
            ),
          ],
        ),
      ),
      body: const Center(
        child: Text(
          'Bienvenido a mis Practicas :)',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
