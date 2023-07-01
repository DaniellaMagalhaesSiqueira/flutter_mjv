import 'package:flutter/material.dart';

class IconButtonComponent extends StatelessWidget {
  final Function()? onPressed;
  final IconData icon;
  final Color? color;
  final double size;

  const IconButtonComponent({
    super.key,
    this.icon = Icons.add,
    this.color,
    this.onPressed,
    this.size = 20,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed: onPressed, icon: Icon(icon));
  }
}
