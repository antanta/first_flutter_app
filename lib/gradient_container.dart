import 'package:first_app/dice_roller.dart';
import 'package:flutter/material.dart';

var startAlignment = Alignment.topLeft;
Alignment endAlignment = Alignment.bottomRight;

class GradientContainer extends StatelessWidget {
  //const GradientContainer(String text, {super.key}) : text = text;

  const GradientContainer(this.text, {super.key, required this.colors});

  final String text;
  final List<Color> colors;

  @override
  Widget build(BuildContext context) {
    return Container(
      // Note no const
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: colors,
          begin: startAlignment,
          end: endAlignment)
      ),
      child: const Center(
        child: DiceRoller()
      //   child: Text(
      //     text,
      //     style : const TextStyle(
      //       color: Colors.white,
      //       fontSize:  28
      //     ),
      //   ),
       ),
    );
  }
}