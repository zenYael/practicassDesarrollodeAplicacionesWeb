import 'package:flutter/material.dart';

class pantalla2 extends StatefulWidget {
  const pantalla2({super.key});

  @override
  _pantalla2State createState() => _pantalla2State();
}

class _pantalla2State extends State<pantalla2> {
  List<String> items = [];

  void _addItem() {
    setState(() {
      items.add("hola mundo");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Practica 3')),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) => ListTile(
          title: Text(items[index]),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addItem,
        child: const Icon(Icons.add),
      ),
    );
  }
}