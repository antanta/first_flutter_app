import 'package:flutter/material.dart';
import 'dart:math';

class DiceRoller extends StatefulWidget{
  const DiceRoller({key}) : super(key: key);

  @override
  State<DiceRoller> createState() {
    return _DiceRollerState();
  }
}

class _DiceRollerState extends State<DiceRoller> {
  final randomizer = Random();
  var activeImage = 'assets/images/dice-2.png';


  void onButtonPressed() {
    setState(() {
      var diceRoll = randomizer.nextInt(6) + 1; 
      activeImage = "assets/images/dice-$diceRoll.png";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
          Image.asset(activeImage, width: 200,),
          const SizedBox(height: 20),
          TextButton(
            onPressed: onButtonPressed, 
            style: TextButton.styleFrom(
              foregroundColor: Colors.white,
              textStyle: const TextStyle(fontSize: 28)
            ),
            child: const Text('Roll dice'))
        ],);
  }
}