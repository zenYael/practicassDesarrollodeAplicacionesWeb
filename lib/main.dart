import 'package:flutter/material.dart';
import 'a.dart';
import 'b.dart';
// Importa la nueva pantalla de registro
import 'c.dart';

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
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => pantalla1())),
              child: const Text('Practica 2'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => pantalla2())),
              child: const Text('Practica 3'),
            ),
            const SizedBox(height: 20),
            // Nuevo botón para la pantalla de registro
            ElevatedButton(
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const RegistrationScreen())),
              child: const Text('Registro'),
            ),
          ],
        ),
      ),
    );
  }
}