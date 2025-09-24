import 'package:flutter/material.dart';
import '../menu.dart';

class ProyectoIndex extends StatelessWidget {
  const ProyectoIndex({super.key});

  @override
  Widget build(BuildContext context) {
    final modulos = [
      {"title": "Notas rápidas", "route": "/notas"},
      {"title": "Calculadora IMC", "route": "/imc"},
      {"title": "Galería local", "route": "/galeria"},
      {"title": "Juego Par o Impar", "route": "/parimpar"},
    ];

    return Scaffold(
      appBar: AppBar(title: const Text("Kit Offline - Proyecto")),
      drawer: const AppDrawer(),
      body: ListView.builder(
        itemCount: modulos.length,
        itemBuilder: (context, i) {
          return ListTile(
            leading: const Icon(Icons.arrow_forward),
            title: Text(modulos[i]["title"]!),
            onTap: () => Navigator.pushNamed(context, modulos[i]["route"]!),
          );
        },
      ),
    );
  }
}
