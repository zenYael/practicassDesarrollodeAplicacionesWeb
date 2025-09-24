import 'dart:math';
import 'package:flutter/material.dart';
import '../menu.dart';

class ParImparScreen extends StatefulWidget {
  const ParImparScreen({super.key});

  @override
  State<ParImparScreen> createState() => _ParImparScreenState();
}

class _ParImparScreenState extends State<ParImparScreen> {
  String userChoice = 'Par';
  int userScore = 0;
  int cpuScore = 0;

  void jugar(int numero) {
    final cpu = Random().nextInt(6);
    final suma = numero + cpu;
    String resultado;

    if ((suma % 2 == 0 && userChoice == 'Par') || (suma % 2 == 1 && userChoice == 'Impar')) {
      resultado = 'Ganaste';
      userScore++;
    } else {
      resultado = 'Perdiste';
      cpuScore++;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Tu: $numero  CPU: $cpu  → $resultado')),
    );

    setState(() {});
  }

  void reiniciar() {
    setState(() {
      userScore = 0;
      cpuScore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Juego Par o Impar')),
      drawer: const AppDrawer(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Marcador: Usuario $userScore - CPU $cpuScore', style: const TextStyle(fontSize: 20)),
            const SizedBox(height: 20),
            ToggleButtons(
              isSelected: [userChoice == 'Par', userChoice == 'Impar'],
              onPressed: (i) {
                setState(() => userChoice = i == 0 ? 'Par' : 'Impar');
              },
              children: const [Padding(padding: EdgeInsets.all(8), child: Text('Par')),
                         Padding(padding: EdgeInsets.all(8), child: Text('Impar'))],
            ),
            const SizedBox(height: 20),
            Wrap(
              spacing: 8,
              children: List.generate(6, (i) {
                return ElevatedButton(
                  onPressed: () => jugar(i),
                  child: Text('$i'),
                );
              }),
            ),
            const SizedBox(height: 20),
            OutlinedButton(onPressed: reiniciar, child: const Text('Reiniciar marcador')),
          ],
        ),
      ),
    );
  }
}
