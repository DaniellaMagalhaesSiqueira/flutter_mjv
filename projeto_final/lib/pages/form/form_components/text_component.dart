import 'package:flutter/material.dart';

class TextComponent extends StatelessWidget {
  final text;
  const TextComponent({super.key, this.text = 'Texto'});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 12,
      ),
    );
  }
}
