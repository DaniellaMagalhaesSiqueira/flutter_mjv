import 'package:app1/components/icon_button_component.dart';
import 'package:app1/components/spacer_component.dart';
import 'package:app1/entities/afazer_entity.dart';
import 'package:flutter/material.dart';

class DetalheMenuWidget extends StatelessWidget {
  final AfazeresEntity item;

  final Function() onDone;
  final Function() onDelete;

  const DetalheMenuWidget({
    super.key,
    required this.item,
    required this.onDelete,
    required this.onDone,
  });

  @override
  Widget build(BuildContext context) {
    
    return Row(
      children: [
        if (item.conteudos.isNotEmpty)
          const Text(
            'Tarefas',
            style: TextStyle(fontSize: 24),
          ),
        const SpacerComponent(
          isFull: true,
        ),
        IconButtonComponent(
          size: 18,
          color: (item.isConcluido == true) ? Colors.green: Colors.grey[600],
          icon: (item.isConcluido == true) ? Icons.done_all : Icons.done,
          onPressed: onDone,
        ),
         IconButtonComponent(
          size: 18,
          color: Colors.red,
          icon: Icons.delete_forever,
          onPressed: onDelete,
        ),
      ],
    );
  }
}
