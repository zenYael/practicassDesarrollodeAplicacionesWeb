import 'package:flutter/material.dart';
import 'menu.dart';

class HubScreen extends StatelessWidget {
  final Function(bool) toggleTheme;
  final bool isDark;

  const HubScreen({super.key, required this.toggleTheme, required this.isDark});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Hub Principal")),
      drawer: const AppDrawer(),
      body: GridView.count(
        padding: const EdgeInsets.all(16),
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        children: [
          _buildCard(context, Icons.list, "Prácticas", "/practicas"),
          _buildCard(context, Icons.build, "Proyecto", "/notas"), // puedes hacer un menú intermedio
          _buildCard(context, Icons.settings, "Ajustes", "/ajustes"),
        ],
      ),
    );
  }

  Widget _buildCard(BuildContext context, IconData icon, String title, String route) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, route),
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: 48),
              const SizedBox(height: 8),
              Text(title, style: const TextStyle(fontSize: 18)),
            ],
          ),
        ),
      ),
    );
  }
}
