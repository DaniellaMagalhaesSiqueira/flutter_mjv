

import 'package:app1/providers/afazer_provider.dart';
import 'package:app1/providers/config_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../components/icon_button_component.dart';
import '../../../components/spacer_component.dart';

class AbaPerfil extends StatefulWidget {
  const AbaPerfil({super.key});

  @override
  State<AbaPerfil> createState() => _AbaPerfilState();
}

class _AbaPerfilState extends State<AbaPerfil> {

  late AfazerProvider store;

  late ConfigProvider storeConfig;

  @override
  Widget build(BuildContext context) {
    store = Provider.of<AfazerProvider>(context);
    storeConfig = Provider.of<ConfigProvider>(context);
    return Container(
          padding: const EdgeInsets.all(16),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Card(
                margin: const EdgeInsets.all(0),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Row(
                    children: [
                      const CircleAvatar(child: Text('D')),
                      const SpacerComponent(isHorizontal: true, size: 8),
                      const Text('Daniella Siqueira',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      const SpacerComponent(isFull: true,),
                      IconButtonComponent(
                        icon: Icons.more_vert,
                        onPressed: () {},
                      ),
                    ],
                  ),
                )),
            const SpacerComponent(),
            const Text(
              'Minhas Estatísticas',
              style: TextStyle(fontSize: 18),
            ),
             const SizedBox(height: 16),
            Row(
              children: [
                const Icon(Icons.list),
                const SpacerComponent(),
                const Text('Total de Notas: '),
                Text(store.listaAfazeres.length.toString()),
              ],
            ),
            Row(
              children: [
                const Icon(Icons.list),
                const SpacerComponent(),
                const Text('Concluídas: '),
                Text(store.listaAfazeres.where((el) => el.isConcluido == true).length.toString()),
              ],
            ),
            const SpacerComponent(),
            const SpacerComponent(isFull: true, isHorizontal: true),
            const SpacerComponent(isHorizontal: true, size: 8),
            const Text(
              'Minhas estatísticas',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 16,),
            // const SpacerComponent(isHorizontal: true,),
            Row(
              children: [
                const Text('Tema Escuro'),
                const SpacerComponent(isHorizontal: true),
               Switch(
                value: storeConfig.tema == ThemeMode.dark, 
                onChanged: (val) {
                  storeConfig.tema = val ? ThemeMode.dark : ThemeMode.light;
                },
                ),
              ],
            )
          ]),
        );
  }
}