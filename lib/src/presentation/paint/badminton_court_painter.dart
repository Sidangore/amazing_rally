import 'package:badminton_1/src/constants/constants.dart';
import 'package:flutter/material.dart';

class BadmintonCourtPainter extends CustomPainter {  
  @override
  void paint(Canvas canvas, Size size) {
    // Land Dimensions
    final landWidth = size.width;
    final landHeight = size.height;

    final courtWidth = landWidth * kCourtWidthRatio;
    final courtHeight = landHeight * kCourtHeightRatio;
    final innerWidth = courtWidth * kInnerWidthRatio;
    final innerHeight = courtHeight * kInnerHeightRatio;

    // Colors and Paints
    final landPaint = Paint()
      ..color = const Color(0xFFC2B280)
      ..style = PaintingStyle.fill;
    final courtPaint = Paint()
      ..color = const Color(0xFF388E3C)
      ..style = PaintingStyle.fill;
    final borderPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4;

    // Draw the land
    canvas.drawRect(
      Rect.fromCenter(
          center: Offset(landWidth / 2, landHeight / 2),
          width: landWidth,
          height: landHeight),
      landPaint,
    );

    // Draw the court
    final courtRect = Rect.fromCenter(
      center: Offset(landWidth / 2, landHeight / 2),
      width: courtWidth,
      height: courtHeight,
    );
    canvas.drawRect(courtRect, courtPaint);

    // Draw the white border
    canvas.drawRect(courtRect, borderPaint);

    // Drawing the inner rectangle
    final innerRect = Rect.fromCenter(
      center: Offset(landWidth / 2, landHeight / 2),
      width: innerWidth,
      height: innerHeight,
    );
    canvas.drawRect(innerRect, borderPaint);

    // Draw the net    
    final startY = (landHeight - innerHeight) / 2;
    final endY = landHeight - (landHeight - innerHeight) / 2;
    final x = landWidth / 2;
    
    for (double y = startY; y < endY - kDashWidth; y += kDashWidth + kDashSpace) {
      canvas.drawLine(
        Offset(x, y),
        Offset(x, y + kDashWidth),
        borderPaint,
      );
    }

    // Draw the center line
    // Draw center line on left side
    canvas.drawLine(
      Offset(landWidth / 2 - (courtWidth / 2), landHeight / 2),
      Offset((landWidth / 2) * 0.76, landHeight / 2),
      borderPaint,
    );
    // Draw center line on right side
    canvas.drawLine(
      Offset(landWidth / 2 + (courtWidth / 2), landHeight / 2),
      Offset((landWidth / 2) * 1.24, landHeight / 2),
      borderPaint,
    );

    // Draw side lines
    canvas.drawLine(
      Offset(landWidth / 2 - (courtWidth / 2), (landHeight - innerHeight) / 2),
      Offset(landWidth / 2 + (courtWidth / 2), (landHeight - innerHeight) / 2),
      borderPaint,
    );
    canvas.drawLine(
      Offset(landWidth / 2 - (courtWidth / 2),
          landHeight - (landHeight - innerHeight) / 2),
      Offset(landWidth / 2 + (courtWidth / 2),
          landHeight - (landHeight - innerHeight) / 2),
      borderPaint,
    );

    // Draw third line
    canvas.drawLine(
      Offset(landWidth / 2 - (innerWidth / 2), (landHeight - courtHeight) / 2),
      Offset(landWidth / 2 - (innerWidth / 2),
          landHeight - (landHeight - courtHeight) / 2),
      borderPaint,
    );
    canvas.drawLine(
      Offset(landWidth / 2 + (innerWidth / 2), (landHeight - courtHeight) / 2),
      Offset(landWidth / 2 + (innerWidth / 2),
          landHeight - (landHeight - courtHeight) / 2),
      borderPaint,
    );

    // Draw service box
    final serviceBoxRect = Rect.fromCenter(
      center: Offset(landWidth / 2, landHeight / 2),
      width: innerWidth * kServiceBoxWidthRatio,
      height: courtHeight,
    );
    canvas.drawRect(serviceBoxRect, borderPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
