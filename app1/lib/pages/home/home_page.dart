import 'package:app1/components/appBar_component.dart';
import 'package:app1/pages/home/abas/aba_afazeres.dart';
import 'package:app1/pages/home/abas/aba_perfil.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  late int abaSelecionada;

  

  @override
  Widget build(BuildContext context) {
    //variáveis privadas são iniciadas com '_'
    final List<BottomNavigationBarItem> _abas = [
      const BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
      const BottomNavigationBarItem(
          icon: Icon(Icons.account_circle), label: 'Perfil'),
    ];

    final List<Widget> _conteudo = [
      AbaAfazeres(
        valorInicial: 0,
        callback: (tabIndex) {
          print(tabIndex);
        },
      ),
      const AbaPerfil(),
    ];

    void handleTab(int tabIndex) {
    setState(() {
      abaSelecionada = tabIndex;
    });
  }

    @override
    void initState() {
      abaSelecionada = 0;
      super.initState();
    }

    return Scaffold(
      appBar: const AppBarComponent(),
      body: _conteudo.elementAt(abaSelecionada),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: abaSelecionada,
        items: _abas,
        onTap: handleTab,
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        handleTab(1);
      }, child: const Icon(Icons.add),),
    );
  }
}
