import 'package:app1/components/spacer_component.dart';
import 'package:flutter/material.dart';

class AbaAfazeres extends StatefulWidget {
  final int valorInicial;
  final void Function(int tabIndex)? callback;

  const AbaAfazeres({
    super.key,
    required this.valorInicial,
    this.callback,
  });
  @override
  State createState() => _AbaAfazeres();
}

class _AbaAfazeres extends State<AbaAfazeres> {
  late int acumulador;

  void somarMaisUm() {
    setState(() {
      acumulador++;
    });
  }

  void handleCallback() {
    if (widget.callback != null) {
      widget.callback!(1);
    }
  }

  @override
  void initState() {
    acumulador = widget.valorInicial;
    // buscarDados();
    super.initState();
  }

  //  buscarDados() async {
  //   await service.fectch();
  // }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('$acumulador'),
        const SpacerComponent(),
        ElevatedButton(
          onPressed: somarMaisUm,
          child: const Text('+1'),
        ),
        const SpacerComponent(),
        ElevatedButton(
          onPressed: handleCallback,
          child: const Text('callback'),
        )
      ],
    );
  }
}
