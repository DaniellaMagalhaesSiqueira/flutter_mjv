

import 'package:flutter/material.dart';

import '../../../components/icon_button_component.dart';
import '../../../components/spacer_component.dart';

class AbaPerfil extends StatelessWidget {
  const AbaPerfil({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
          padding: const EdgeInsets.all(20),
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
                      const Spacer(),
                      IconButtonComponent(
                        icon: Icons.more,
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
            const SpacerComponent(),
            Row(
              children: const [
                Icon(Icons.list),
                SpacerComponent(),
                Text('Total de Notas: '),
                Text('0'),
              ],
            ),
            Row(
              children: const [
                Icon(Icons.list),
                SpacerComponent(),
                Text('Concluídas: '),
                Text('0'),
              ],
            ),
            const SpacerComponent(),
            const Divider(),
            const SpacerComponent(isHorizontal: true, size: 8),
            const Text(
              'Configurações',
              style: TextStyle(fontSize: 18),
            ),
            const SpacerComponent(),
            Row(
              children: [
                const Text('Tema Escuro'),
                const SpacerComponent(isFull: true),
                Switch(value: true, onChanged: (val) {})
              ],
            )
          ]),
        );
  }
}