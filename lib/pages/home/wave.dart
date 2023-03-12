import 'dart:math';

import 'package:flutter/material.dart';

class WaveDefinition {
  final Color color;
  final Point<double> start;
  final Point<double> end;
  final List<WavePoint> points;
  final bool debug;

  WaveDefinition(this.color, this.start, this.points, this.end,
      {this.debug = false});

  Path makePath(double width, double height) {
    return points.fold(Path()..moveTo(start.x * width, start.y * height),
        (path, wavePoint) {
      return path
        ..quadraticBezierTo(
            wavePoint.controlPoint.x * width,
            wavePoint.controlPoint.y * height,
            wavePoint.point.x * width,
            wavePoint.point.y * height);
    })
      ..lineTo(end.x * width, end.y * height)
      ..lineTo(0, 0)
      ..close();
  }
}

class WavePoint {
  final Point<double> point;
  final Point<double> controlPoint;

  WavePoint(this.controlPoint, this.point);
}

class Wave extends StatelessWidget {
  final double elevation;
  final List<WaveDefinition> waves;
  final Color shadowColor;

  const Wave({Key? key, required this.waves, required this.elevation, required this.shadowColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ClipRect(
        clipper: WaveShadowClipper(elevation: elevation, debug: false),
        child: Stack(
          fit: StackFit.expand,
          children: waves.reversed
              .map((wave) => CustomPaint(
                    painter: WavePainter(
                      wave: wave,
                      elevation: elevation,
                      shadowColor: shadowColor,
                      debug: wave.debug,
                    ),
                  ))
              .toList(),
        ),
      ),
    );
  }
}

class WaveShadowClipper extends CustomClipper<Rect> {
  final bool debug;
  final double elevation;

  WaveShadowClipper({required this.elevation, this.debug = false});

  @override
  Rect getClip(Size size) {
    // This is the height space over which graphics operations are valid
    const giantScalar = 1.0E+9;
    return debug ? Rect.largest : Rect.fromLTRB(0, 0, size.width, giantScalar);
  }

  @override
  bool shouldReclip(WaveShadowClipper oldClipper) {
    return oldClipper.debug != debug;
  }
}

class WavePainter extends CustomPainter {
  final double elevation;
  final bool debug;
  final WaveDefinition wave;
  final Color shadowColor;

  WavePainter({
    required this.wave,
    required this.elevation,
    this.debug = false,
    required this.shadowColor
  });

  @override
  void paint(Canvas canvas, Size size) {
    final height = size.height;
    final width = size.width;

    Path path = wave.makePath(width, height);

    Paint paint = Paint()
      ..style = PaintingStyle.fill
      ..color = wave.color;

    canvas.drawShadow(path, shadowColor, elevation, false);
    canvas.drawPath(path, paint);
    if (debug) {
      _drawDebug(
          canvas, paint..color = Colors.green, 'S', width, height, wave.start);
      int index = 0;
      wave.points.forEach((point) {
        _drawDebug(canvas, paint..color = Colors.red, '$index', width, height,
            point.controlPoint);
        _drawDebug(canvas, paint..color = Colors.black, '$index', width, height,
            point.point);
        index++;
      });
      _drawDebug(
          canvas, paint..color = Colors.green, 'E', width, height, wave.end);
    }
  }

  _drawDebug(Canvas canvas, Paint paint, String text, double width,
      double height, Point<double> point) {
    final center = Offset(point.x * width, point.y * height);
    canvas.drawCircle(center, 12, paint);
    TextSpan span = TextSpan(
      text: text,
      style: const TextStyle(color: Colors.white, fontSize: 12),
    );
    TextPainter tp = TextPainter(
        text: span,
        textAlign: TextAlign.center,
        textDirection: TextDirection.ltr);
    tp.layout();
    tp.paint(canvas, center - const Offset(4, 8));
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
