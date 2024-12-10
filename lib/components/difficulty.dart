import 'package:flutter/material.dart';

class Difficulty extends StatelessWidget {

  final int difficulty;

  const Difficulty({
    super.key,
    required this.difficulty,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Estrelas de dificuldade
        Icon(Icons.star,
            size: 15,
            color: difficulty >= 1
                ? Colors.blue
                : Colors.blue[100]),
        Icon(Icons.star,
            size: 15,
            color: difficulty >= 2
                ? Colors.blue
                : Colors.blue[100]),
        Icon(Icons.star,
            size: 15,
            color: difficulty >= 3
                ? Colors.blue
                : Colors.blue[100]),
        Icon(Icons.star,
            size: 15,
            color: difficulty >= 4
                ? Colors.blue
                : Colors.blue[100]),
        Icon(Icons.star,
            size: 15,
            color: difficulty >= 5
                ? Colors.blue
                : Colors.blue[100]),
      ],
    );
  }
}