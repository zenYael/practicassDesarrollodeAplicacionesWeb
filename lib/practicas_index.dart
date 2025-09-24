import 'package:flutter/material.dart';
import 'menu.dart';

class PracticasIndex extends StatelessWidget {
  const PracticasIndex({super.key});

  @override
  Widget build(BuildContext context) {
    final practicas = [
      {"title": "Práctica 1", "route": "/p1"},
      {"title": "Práctica 2", "route": "/p2"},
      {"title": "Práctica 3", "route": "/p3"},
      {"title": "Práctica 4", "route": "/p4"},
    ];

    return Scaffold(
      appBar: AppBar(title: const Text("Índice de Prácticas")),
      drawer: const AppDrawer(),
      body: ListView.builder(
        itemCount: practicas.length,
        itemBuilder: (context, i) {
          return ListTile(
            leading: const Icon(Icons.arrow_forward),
            title: Text(practicas[i]["title"]!),
            onTap: () => Navigator.pushNamed(context, practicas[i]["route"]!),
          );
        },
      ),
    );
  }
}
