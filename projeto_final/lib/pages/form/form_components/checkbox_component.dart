import 'package:flutter/material.dart';

class CheckboxComponent extends StatefulWidget {
  const CheckboxComponent({super.key});

  @override
  State<CheckboxComponent> createState() => _CheckboxComponentState();
}

class _CheckboxComponentState extends State<CheckboxComponent> {

  bool isChecked = false;

  @override
  Widget build(BuildContext context) {

    Color getColor (Set<MaterialState> states){
      const Set<MaterialState> interactiveSatates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if(states.any(interactiveSatates.contains)){
        return Colors.blue;
      }
      return Colors.red;
    }

    return Checkbox(
      checkColor: Colors.white,
      fillColor: MaterialStateProperty.resolveWith((states) => getColor(states)),
      value: isChecked,
      onChanged: (bool? value){
        setState(() {
          isChecked = value!;
        });
      }
    );
  }
}