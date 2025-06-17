import 'package:flutter/material.dart';

class ScoreDisplay extends StatelessWidget {
  final int score;
  const ScoreDisplay({super.key, required this.score});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Text(
          '$score',
          style: TextStyle(
            color: Colors.yellow,
            fontSize: MediaQuery.of(context).size.width * 0.20,
            fontWeight: FontWeight.bold,
            shadows: const [
              Shadow(
                blurRadius: 4,
                color: Colors.black54,
                offset: Offset(2, 2),
              ),
            ],
          ),
        ),
      ),
    );
  }
}