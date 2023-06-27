//  Text(item.titulo,
//               textAlign: TextAlign.left, style: const TextStyle(fontSize: 20)),
//           SizedBox(
//             height: MediaQuery.of(context).size.height - 550,
//             child: ListView.builder(
//               itemCount: item.conteudos.length,
//               itemBuilder: (context, index) {
//                 final conteudo = item.conteudos[index];
//                 return CheckboxListTile(
//                   value: conteudo.isChecked,
//                   title: Text(conteudo.titulo),
//                   controlAffinity: ListTileControlAffinity.leading,
//                   onChanged: (value) {
//                     setState(() {
//                       conteudo.isChecked = value!;

//                     });
//                   },
//                   // secondary: IconButtonComponent(
//                   //   icon: Icons.delete,
//                   //   color: Colors.red,
//                   //   onPressed: () {
//                   //     int idxCont = item.conteudos.indexOf(conteudo);
//                   //     setState(() {
//                   //       excluirConteudo(idxCont,index);
//                   //     });
//                   //   },
//                   // ),
//                 );
//               },
//             ),
//           ),
//           SizedBox(
//             height: 100,
//             child: Row(children: [
//               const IconButtonComponent(),
//             ]),
//           ),