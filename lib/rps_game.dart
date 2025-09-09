import 'dart:math';
import 'package:flutter/material.dart';

class RpsGame extends StatefulWidget {
  const RpsGame({super.key});

  @override
  State<RpsGame> createState() => _RpsGameState();
}

class _RpsGameState extends State<RpsGame> {
  final List<String> choices = ['Piedra', 'Papel', 'Tijera'];
  String userChoice = '';
  String deviceChoice = '';
  String result = '';
  int userScore = 0;
  int deviceScore = 0;

  void playRound(String choice) {
    final random = Random();
    final device = choices[random.nextInt(choices.length)];

    setState(() {
      userChoice = choice;
      deviceChoice = device;
      result = determineWinner(choice, device);

      if (result == 'Ganaste') {
        userScore++;
      } else if (result == 'Perdiste') {
        deviceScore++;
      }
    });
  }

  String determineWinner(String user, String device) {
    if (user == device) return 'Empate';

    if ((user == 'Piedra' && device == 'Tijera') ||
        (user == 'Papel' && device == 'Piedra') ||
        (user == 'Tijera' && device == 'Papel')) {
      return 'Ganaste';
    } else {
      return 'Perdiste';
    }
  }

  void resetGame() {
    setState(() {
      userScore = 0;
      deviceScore = 0;
      userChoice = '';
      deviceChoice = '';
      result = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Juego: Piedra, Papel o Tijera')),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Elige tu jugada:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),

              /// Botones de elección
              Wrap(
                spacing: 20,
                alignment: WrapAlignment.center,
                children: choices.map((choice) {
                  return ElevatedButton(
                    onPressed: () => playRound(choice),
                    child: Text(choice),
                  );
                }).toList(),
              ),
              const SizedBox(height: 30),

              /// Elecciones y resultado
              Text('Tu elección: $userChoice', style: const TextStyle(fontSize: 18)),
              Text('Elección del dispositivo: $deviceChoice', style: const TextStyle(fontSize: 18)),
              const SizedBox(height: 20),
              Text(
                'Resultado: $result',
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 30),

              /// Marcador
              const Text('Marcador', style: TextStyle(fontSize: 22)),
              const SizedBox(height: 10),
              Text(
                'Usuario: $userScore   -   Dispositivo: $deviceScore',
                style: const TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 30),

              /// Botón para reiniciar
              ElevatedButton(
                onPressed: resetGame,
                child: const Text('Reiniciar Marcador'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
