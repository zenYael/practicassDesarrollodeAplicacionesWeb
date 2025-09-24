import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'Menú de navegación',
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Inicio'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushReplacementNamed(context, '/');
            },
          ),
          ListTile(
            leading: const Icon(Icons.list),
            title: const Text('Prácticas'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/practicas');
            },
          ),
          ListTile(
            leading: const Icon(Icons.build),
            title: const Text('Proyecto'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/proyecto');
            },
          ),

          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Ajustes'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/ajustes');
            },
          ),
        ],
      ),
    );
  }
}
