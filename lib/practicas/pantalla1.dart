import 'package:flutter/material.dart';
import '../menu.dart'; // Importa el menú hamburguesa

class pantalla1 extends StatefulWidget {
  const pantalla1({super.key});

  @override
  _pantalla1State createState() => _pantalla1State();
}

class _pantalla1State extends State<pantalla1> {
  List<String> items = [];

  void _generateItems() {
    setState(() {
      items = List.filled(10, "hola mundo");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Practica 1')),
      drawer: const AppDrawer(), // ← Aquí integramos el menú
      body: Column(
        children: [
          ElevatedButton(
            onPressed: _generateItems,
            child: const Text('Generar'),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) => ListTile(
                title: Text(items[index]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
