import 'dart:math';

import 'package:flutter/material.dart';
import 'package:wave_header/pages/home/wave.dart';

final defaultWaves = [
  WaveDefinition(
    Colors.red,
    const Point(0, 0.75),
    [
      WavePoint(const Point(0.10, 0.15), const Point(0.22, 0.50)),
      WavePoint(const Point(0.30, 0.90), const Point(0.40, 0.55)),
      WavePoint(const Point(0.52, 0.10), const Point(0.65, 0.70)),
      WavePoint(const Point(0.75, 1.05), const Point(1, 0.20)),
    ],
    const Point(1, 0),
  ),
  WaveDefinition(
      Colors.orange[300]!,
      const Point(0, 0.50),
      [
        WavePoint(const Point(0.10, 0.80), const Point(0.15, 0.60)),
        WavePoint(const Point(0.20, 0.45), const Point(0.27, 0.60)),
        WavePoint(const Point(0.45, 1.25), const Point(0.50, 0.80)),
        WavePoint(const Point(0.55, 0.15), const Point(0.75, 0.75)),
        WavePoint(const Point(0.85, 0.93), const Point(1, 0.60)),
      ],
      const Point(1, 0),
      debug: false),
  WaveDefinition(
      Colors.orange[100]!,
      const Point(0, 0.75),
      [
        WavePoint(const Point(0.10, 0.30), const Point(0.17, 0.70)),
        WavePoint(const Point(0.20, 1), const Point(0.25, 0.70)),
        WavePoint(const Point(0.40, 0.10), const Point(0.50, 0.70)),
        WavePoint(const Point(0.60, 0.85), const Point(0.65, 0.65)),
        WavePoint(const Point(0.70, 0.90), const Point(1, 0)),
      ],
      const Point(1, 0)),
];
