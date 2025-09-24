import 'package:flutter/material.dart';
import 'hub.dart';
import 'practicas_index.dart';
import 'ajustes.dart';
import 'practicas/pantalla1.dart';
import 'practicas/pantalla2.dart';
import 'practicas/pantalla3.dart';
import 'practicas/pantalla4.dart';
import 'proyecto/imc.dart';
import 'proyecto/galeria.dart';
import 'proyecto/par_impar.dart';
import 'proyecto/notas.dart';
import 'proyecto/proyecto_index.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode themeMode = ThemeMode.light;

  void toggleTheme(bool isDark) {
    setState(() {
      themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Portafolio',
      debugShowCheckedModeBanner: false,
      themeMode: themeMode,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      initialRoute: '/',
      routes: {
        '/': (_) => HubScreen(toggleTheme: toggleTheme, isDark: themeMode == ThemeMode.dark),
        '/practicas': (_) => const PracticasIndex(),
        '/ajustes': (_) => AjustesScreen(toggleTheme: toggleTheme, isDark: themeMode == ThemeMode.dark),
        '/p1': (_) => const pantalla1(),
        '/p2': (_) => const pantalla2(),
        '/p3': (_) => const pantalla3(),
        '/p4': (_) => const pantalla4(),
        '/proyecto': (_) => const ProyectoIndex(),
        '/notas': (_) => const NotasScreen(),
        '/imc': (_) => const ImcScreen(),
        '/galeria': (_) => GaleriaScreen(),
        '/parimpar': (_) => const ParImparScreen(),
        
      },
    );
  }
}
