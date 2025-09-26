import 'package:flutter/material.dart';
import '../menu.dart';

class GaleriaScreen extends StatelessWidget {
  GaleriaScreen({super.key});

  final List<String> images = [
    'images/imagen1.jpg',
    'images/imagen2.jpg',
    'images/imagen3.jpg',
    'images/imagen4.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Galería')),
      drawer: const AppDrawer(),
      body: GridView.count(
        crossAxisCount: 2,
        children: images.map((img) {
          return GestureDetector(
            onTap: () {
              showDialog(
                context: context,
                builder: (_) => AlertDialog(
                  title: const Text('Imagen'),
                  content: Image.asset(img),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('Cerrar'),
                    ),
                  ],
                ),
              );
            },
            child: Card(
              margin: const EdgeInsets.all(8),
              child: Image.asset(img, fit: BoxFit.cover),
            ),
          );
        }).toList(),
      ),
    );
  }
}
