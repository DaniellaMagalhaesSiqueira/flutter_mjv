import 'package:app1/components/appBar_component.dart';
import 'package:app1/components/body_component.dart';
import 'package:app1/entities/afazer_entity.dart';
import 'package:app1/pages/home/abas/aba_afazeres.dart';
import 'package:app1/pages/home/abas/aba_perfil.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/afazer_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  late AfazerProvider store;
  late int abaSelecionada;
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
    store = Provider.of<AfazerProvider>(context, listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //variáveis privadas são iniciadas com '_'
    return BodyComponent(
      
      margin: const EdgeInsets.all(0),
      padding: const EdgeInsets.all(0),
      bar: BottomNavigationBar(
        currentIndex: abaSelecionada,
        items: _abas,
        onTap: handleTab,
      ),
      actionButton: FloatingActionButton(
        onPressed: () {
          store.abrirModalCadastratro(context);
        },
        child: const Icon(Icons.add),
        
      ),
      child: _conteudo.elementAt(abaSelecionada),
    );
  }
}
