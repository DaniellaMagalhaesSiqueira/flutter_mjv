

import 'package:flutter/material.dart';

import '../../../components/spacer_component.dart';

class RestricionsConponent extends StatelessWidget {
  const RestricionsConponent({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
                  height: 30,
                  child:SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: const [
                            Text('Vegetariana'),
                            SpacerComponent(isHorizontal: true, size: 15,),
                            Text('Vegana'),
                            SpacerComponent(isHorizontal: true, size: 15,),
                            Text('Zero Açúcar'),
                            SpacerComponent(isHorizontal: true, size: 15,),
                            Text('Zero Lactose'),
                          ],
                        ),
                  ),
                );
  }
}