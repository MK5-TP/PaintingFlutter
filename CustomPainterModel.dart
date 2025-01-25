import 'package:flutter/material.dart';
import 'ColorPath.dart';

class PathPainter extends CustomPainter{
final ColorPath colorPath;

PathPainter(this.colorPath);

Paint get paintBrush{
  return Paint() //この辺の意味がまったくわかりませーーーーん
          ..strokeCap = StrokeCap.round
          ..isAntiAlias = true..color = colorPath.color
          ..strokeWidth = colorPath.strokeWidth
          ..style = PaintingStyle.stroke
          ..strokeCap = StrokeCap.round;
}

@override
void paint(Canvas canvas, Size size){
  canvas.drawPath(colorPath.path, paintBrush);
}

@override
bool shouldRepaint(PathPainter old){
  return true;
}
}