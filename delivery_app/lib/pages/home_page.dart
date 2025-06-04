import 'package:flutter/material.dart';
import 'rouillon_page.dart';
import 'stti_page.dart';
import 'joyaux_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Choisissez votre transporteur'),
      ),
      body: GridView.count(
        padding: const EdgeInsets.all(16),
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        children: [
          _logoTile(context, 'Rouillon', Icons.local_shipping, const RouillonPage()),
          _logoTile(context, 'STTI', Icons.fire_truck, const SttiPage()),
          _logoTile(context, 'Joyaux', Icons.local_mall, const JoyauxPage()),
        ],
      ),
    );
  }

  Widget _logoTile(BuildContext context, String title, IconData icon, Widget page) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(builder: (_) => page),
      ),
      child: Card(
        elevation: 4,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 64),
            const SizedBox(height: 12),
            Text(title, style: const TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
