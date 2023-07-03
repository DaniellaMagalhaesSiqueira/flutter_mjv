import 'package:flutter/material.dart';

class ElevatedButtonComponent extends StatelessWidget {
  final Function()? onPressed;
  final Widget child;

  const ElevatedButtonComponent({
    super.key,
    this.onPressed,
    this.child = const Text('Botão'),
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: onPressed, child: child);
  }
}
