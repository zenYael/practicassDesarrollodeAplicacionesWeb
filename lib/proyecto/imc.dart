import 'package:flutter/material.dart';
import '../menu.dart';

class ImcScreen extends StatefulWidget {
  const ImcScreen({super.key});

  @override
  State<ImcScreen> createState() => _ImcScreenState();
}

class _ImcScreenState extends State<ImcScreen> {
  final _formKey = GlobalKey<FormState>();
  final _alturaController = TextEditingController();
  final _pesoController = TextEditingController();

  void _calcularIMC() {
    if (_formKey.currentState!.validate()) {
      final altura = double.parse(_alturaController.text);
      final peso = double.parse(_pesoController.text);
      final imc = peso / (altura * altura);

      String categoria;
      if (imc < 18.5) categoria = "Bajo peso";
      else if (imc < 25) categoria = "Normal";
      else if (imc < 30) categoria = "Sobrepeso";
      else categoria = "Obesidad";

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('IMC: ${imc.toStringAsFixed(2)} ($categoria)')),
      );
    }
  }

  void _limpiar() {
    _formKey.currentState!.reset();
    _alturaController.clear();
    _pesoController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Calculadora de IMC')),
      drawer: const AppDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _alturaController,
                decoration: const InputDecoration(labelText: 'Altura (m)'),
                keyboardType: TextInputType.number,
                validator: (v) {
                  final n = double.tryParse(v ?? '');
                  if (n == null || n <= 0) return 'Ingrese un valor válido';
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _pesoController,
                decoration: const InputDecoration(labelText: 'Peso (kg)'),
                keyboardType: TextInputType.number,
                validator: (v) {
                  final n = double.tryParse(v ?? '');
                  if (n == null || n <= 0) return 'Ingrese un valor válido';
                  return null;
                },
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(onPressed: _limpiar, child: const Text('Limpiar')),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: ElevatedButton(onPressed: _calcularIMC, child: const Text('Calcular')),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
