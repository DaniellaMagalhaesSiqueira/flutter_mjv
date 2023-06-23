import 'package:flutter/material.dart';
import 'receitas_page.dart';

import 'form_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //página selecionada
  late int page;

  final List<BottomNavigationBarItem> _pages = [
    const BottomNavigationBarItem(icon: Icon(Icons.home, ), label: 'Início',),
    const BottomNavigationBarItem(
        icon: Icon(Icons.emoji_flags), label: 'Teste',)
  ];
  //lista de páginas a serem carregadas conforme index
  final List<Widget> _conteudos = [
    const RecipesPage(),
    const FormPage(),
  ];

  void handlePage(int pgIndex) {
    setState(() {
      page = pgIndex;
    });
  }

  @override
  void initState() {
    page = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Livro de Receitas',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        
      ),
      body: _conteudos.elementAt(page),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: page,
        items: _pages,
        onTap: handlePage,
      ),
    );
  }
}
