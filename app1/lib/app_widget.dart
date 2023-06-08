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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Card(
                  margin: const EdgeInsets.all(0),
                  child:  Padding(padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Row (
                    children:  [
                    const CircleAvatar(child: Text('D')),
                    const SizedBox(width: 8),
                    const Text('Daniella Siqueira', style: TextStyle(fontWeight: FontWeight.bold)),
                    const Spacer(),
                    IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),

                  ],),
                )
        ),
        const SizedBox(height: 16,),
        const Text('Minhas Estatísticas', style: TextStyle(fontSize: 18),),
        const SizedBox(height: 8,),
        Row (children: const [
          Icon(Icons.list),
          SizedBox(height: 8,),
          Text('Total de Notas: '),
          Text('0'),
        ],),
        Row (children: const [
          Icon(Icons.list),
          SizedBox(height: 8,),
          Text('Concluídas: '),
          Text('0'),
        ],),
        const SizedBox(width: 16),
        const Divider(),
        const SizedBox(width: 16),
        const Text('Configurações', style: TextStyle(fontSize: 18),),
        const SizedBox(height: 16,),
        Row(children: [
          const Text('Tema Escuro'),
          const Spacer(),
          Switch(value: true, onChanged: (val) {})
        ],)
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