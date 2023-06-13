

import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});


  @override
  Widget build(BuildContext context) {
    //variáveis privadas são iniciadas com '_' 
    final List<BottomNavigationBarItem> _abas =  [
      const BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
      const BottomNavigationBarItem(icon: Icon(Icons.account_circle), label: 'Perfil'),
    ];

    final List<Widget> _conteudo = [
      const Text('Home'), 
      const Text('Perfil'),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('School'),
      ),
      body: _conteudo.elementAt(0),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        items: _abas,

        ),
    );
  }
}