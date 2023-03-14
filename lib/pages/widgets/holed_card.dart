import 'dart:math';

import 'package:flutter/material.dart';

class HoledCard extends StatelessWidget {
  final Widget? child;

  const HoledCard({Key? key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const holeRadius = 22.0;
    return Padding(
      padding: const EdgeInsets.only(right: holeRadius),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          CustomPaint(
            painter: HoledCardPainter(holeRadius: holeRadius),
            child: Container(height: 100, child: child),
          ),
          Positioned(
              top: -holeRadius,
              right: -holeRadius,
              child: Container(
                width: 2*holeRadius,
                height: 2*holeRadius,
                child: FittedBox(
                  child: FloatingActionButton(
                    elevation: 4,
                    onPressed: () {  },
                    child: Icon(
                    Icons.thermostat_rounded,
                    size: 38,
                    color: Colors.white,
                  ),
                  ),
                ),
              ))
        ],
      ),
    );
  }
}

class HoledCardPainter extends CustomPainter {
  late final double holeRadius;

  HoledCardPainter({required this.holeRadius});

  @override
  void paint(Canvas canvas, Size size) {
    const holePadding = 6.0;
    const double radius = 8;
    Paint paint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.fill;
    final width = size.width;
    final height = size.height;

    final a1 = asin(radius/(holeRadius + holePadding));
    print(a1);
    Path path = Path()
      ..moveTo(0, radius)
      ..arcTo(
          Rect.fromPoints(
              Offset(0, height - 2 * radius), Offset(0 + 2 * radius, height)),
          pi,
          -pi / 2,
          false)
      ..arcTo(
          Rect.fromPoints(Offset(width - 2 * radius, height),
              Offset(width, height - 2 * radius)),
          pi / 2,
          -pi / 2,
          false)
      ..arcTo(
          Rect.fromPoints(
              Offset(width - 2 * radius, holeRadius + holePadding - 1),
              Offset(width, holeRadius + holePadding + 2 * radius - 1)),
          0,
          -pi / 2,
          false)
      ..arcTo(
          Rect.fromPoints(
            Offset(width - holeRadius - holePadding, - holeRadius - holePadding),
            Offset(width + holeRadius + holePadding, holeRadius + holePadding),
          ),
          pi / 2 + a1,
          (pi / 2) - 2 * a1 ,
          false)
      ..arcTo(
          Rect.fromPoints(
            Offset(width - holeRadius - holePadding - 2 * radius + 1, 0),
            Offset(width - holeRadius - holePadding + 1, 2 * radius),
          ),
          0,
          -pi/2,
          false)
      ..arcTo(
          Rect.fromPoints(
            Offset(0, 0),
            Offset(2 * radius, 2 * radius),
          ),
          -pi/2,
          -pi/2, false)
      ..close();

    canvas.drawShadow(path, Colors.black, 4, false);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
