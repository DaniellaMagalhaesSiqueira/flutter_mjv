import 'package:app1/components/icon_button_component.dart';
import 'package:app1/components/spacer_component.dart';
import 'package:flutter/material.dart';

import '../../../entities/afazer_entity.dart';


class ItemWidget extends StatelessWidget {


  final AfazeresEntity item;
  final Function() onPressed;
  const ItemWidget({super.key, required this.item, required this.onPressed});


  Widget status() {
    final icon = item.isConcluido == true ? Icons.done_all : Icons.done;
    final colors = item.isConcluido == true ? Colors.green : Colors.grey[400];
    return Icon(icon, color: colors);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Card(
        elevation: 2.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: 
              [
                status(),
                const SpacerComponent(
                  isHorizontal: true,
                ),
                Text(item.titulo, style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold
                ),),
                const SpacerComponent(
                  isFull: true,
                ),
                IconButtonComponent(
                  icon: Icons.arrow_forward_ios,
                  onPressed: onPressed,
                )
              ],
            )),
      ),
    );
  }
}
