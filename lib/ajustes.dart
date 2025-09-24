import 'package:flutter/material.dart';
import 'menu.dart';

class AjustesScreen extends StatelessWidget {
  final Function(bool) toggleTheme;
  final bool isDark;

  const AjustesScreen({super.key, required this.toggleTheme, required this.isDark});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Ajustes")),
      drawer: const AppDrawer(),
      body: ListView(
        children: [
          SwitchListTile(
            title: const Text("Modo oscuro"),
            value: isDark,
            onChanged: toggleTheme,
          ),
          const AboutListTile(
            icon: Icon(Icons.info),
            applicationName: "Portafolio Flutter",
            applicationVersion: "1.0.0",
            applicationLegalese: "Autor: Tu Nombre",
          ),
        ],
      ),
    );
  }
}
