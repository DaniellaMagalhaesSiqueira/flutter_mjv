// ignore_for_file: file_names

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
                const CircleAvatar(child: Text('R')),
                const Text('Texto 1'),
                const Text('Texto 2'),
                const Text('Texto 3'),
                const Divider(),
                Row(children: const [
                  Icon(Icons.add, color: Colors.green),
                  SizedBox(
                    width: 100,
                  ),
                  Icon(Icons.access_alarm, color: Colors.yellow),
                ]),
                Switch(
                  value: true,
                  onChanged: (val) {},
                ),
                const Card(
                  child: Padding(
                      // padding: EdgeInsets.symmetric(vertical: 16),
                      padding: EdgeInsets.all(16),
                      child: Text('Rafael')),
                )
              ],
            )),
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
