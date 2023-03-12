import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:wave_header/pages/home/wave.dart';

import 'default_waves.dart';

class WavePersistentHeaderDelegate extends SliverPersistentHeaderDelegate {
  final Widget title;
  final double elevation;
  final Color shadowColor;
  final bool forceElevated;
  final double minHeight;
  final double maxHeight;
  late final List<WaveDefinition> waves;

  WavePersistentHeaderDelegate({
    required this.title,
    List<WaveDefinition>? waves,
    this.elevation = 4,
    this.shadowColor = Colors.black,
    this.minHeight = 80,
    this.maxHeight = 150,
    this.forceElevated = false,
  }) {
    this.waves = waves ?? defaultWaves;
  }

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    final diff = elevation - (maxExtent - minExtent - shrinkOffset);
    final realElevation = forceElevated ? elevation : clampDouble(diff, 0, elevation);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          color: waves[0].color,
          child: title,
        ),
        Expanded(
          child: Wave(waves: waves, elevation: realElevation, shadowColor: shadowColor,),
        ),
      ],
    );
  }

  @override
  double get maxExtent => maxHeight;

  @override
  double get minExtent => minHeight;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
