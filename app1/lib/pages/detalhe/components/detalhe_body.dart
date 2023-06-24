import 'package:flutter/material.dart';

import '../../../entities/afazer_entity.dart';

class DetalheBody extends StatefulWidget {
  final AfazeresEntity item;

  const DetalheBody({
    super.key,
    required this.item,
  });

  @override
  State<DetalheBody> createState() => _DetalheBodyState();
}

class _DetalheBodyState extends State<DetalheBody> {
  //inserir a lista de conteúdos
  //TODO fazer condicional caso seja tarefa
  List<bool> checkedItems = List.generate(1, (index) => false);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      height: double.maxFinite,
      child: Column(
        
        children: [
    
          ListView.builder(
            itemBuilder: (context, index) {
              return SizedBox(
                height: 100,
                child: CheckboxListTile(
                    value: checkedItems[index],
                    onChanged: (value) {
                      setState(() {});
                    }),
              );
            },
          ),
        ],
      ),
    );
  }
}
