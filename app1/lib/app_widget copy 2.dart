import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'School',
      home: Scaffold(
        body: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(children: const [
                  CircleAvatar(child: Text('D')),
                  SizedBox(width: 20),
                  Text('Daniella Siqueira'),
                ]),
                const Divider(),
                Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Minhas Estatísticas'),
                      const SizedBox(height: 16),
                      Row(
                        children: const [
                          Icon(Icons.list),
                          Text('Total de Notas: 0')
                        ],
                      ),
                      Row(
                        children: const [
                          Icon(Icons.done_all),
                          Text('Concluídas: 0')
                        ],
                      ),
                      const Divider(),
                      const SizedBox(height: 16),
                      const Text('Configurações'),
                      Row(
                        children: [
                          const Text('Tema Escuro'),
                          const Spacer(),
                          Switch(value: true, onChanged: (val) {}),
                        ],
                      )
                    ]),
              ]),
        ),
      ),
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});

//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
   
//     return Container(
//       color: Colors.red,
//       child: const Text('Meu app'),
//     );
    
//   }
// }