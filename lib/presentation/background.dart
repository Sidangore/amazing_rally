import 'package:badminton_1/presentation/paint/badminton_court_painter.dart';
import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  const Background({super.key});

  @override
  Widget build(BuildContext context) {
    return court(context);
  }
}

Widget court(BuildContext context) {
  return SizedBox.expand(
    child: CustomPaint(
      size: Size.infinite,
      painter: BadmintonCourtPainter(),
      child: Center(
        child: Text(
          'vs',
          style: TextStyle(
            color: Colors.yellow,
            fontSize: MediaQuery.of(context).size.width * 0.10,
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
    ),
  );
}
