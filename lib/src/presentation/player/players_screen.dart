import 'package:flutter/material.dart';

class PlayerOverlay extends StatelessWidget {
  final String topLeftName;
  final String topRightName;
  final String bottomLeftName;
  final String bottomRightName;
  final String
      servingQuadrant; // "topLeft", "topRight", "bottomLeft", "bottomRight"

  const PlayerOverlay({
    super.key,
    required this.topLeftName,
    required this.topRightName,
    required this.bottomLeftName,
    required this.bottomRightName,
    required this.servingQuadrant,
  });

  @override
  Widget build(BuildContext context) {
    Widget quadrant(String name, bool isServing) {
      return Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (isServing)
              const Icon(
                Icons.sports, // Or use your shuttle image/icon here
                color: Colors.yellow,
                size: 28,
                shadows: [
                  Shadow(
                    blurRadius: 4,
                    color: Colors.black54,
                    offset: Offset(2, 2),
                  ),
                ],
              ),
            if (isServing)
              const SizedBox(width: 8), // Space between icon and name
            Text(
              name,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
                shadows: [
                  Shadow(
                    blurRadius: 4,
                    color: Colors.black54,
                    offset: Offset(2, 2),
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      );
    }

    return IgnorePointer(
      child: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                    child: quadrant(topLeftName, servingQuadrant == "topLeft")),
                Expanded(
                    child:
                        quadrant(topRightName, servingQuadrant == "topRight")),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                    child: quadrant(
                        bottomLeftName, servingQuadrant == "bottomLeft")),
                Expanded(
                    child: quadrant(
                        bottomRightName, servingQuadrant == "bottomRight")),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
