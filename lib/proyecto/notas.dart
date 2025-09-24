import 'package:flutter/material.dart';
import '../menu.dart';

class NotasScreen extends StatefulWidget {
  const NotasScreen({super.key});

  @override
  State<NotasScreen> createState() => _NotasScreenState();
}

class _NotasScreenState extends State<NotasScreen> {
  final List<String> notas = [];
  final TextEditingController _controller = TextEditingController();

  void _agregarNota() {
    if (_controller.text.isEmpty) return;
    setState(() {
      notas.add(_controller.text);
      _controller.clear();
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Nota agregada')),
    );
  }

  void _borrarTodo() {
    setState(() => notas.clear());
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Todas las notas eliminadas')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notas rápidas'),
        actions: [
          IconButton(onPressed: _borrarTodo, icon: const Icon(Icons.delete))
        ],
      ),
      drawer: const AppDrawer(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      labelText: 'Nueva nota',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(onPressed: _agregarNota, child: const Text('Agregar'))
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: notas.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(notas[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
