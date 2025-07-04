import 'package:flutter/material.dart';

class Darken extends StatelessWidget {
  const Darken({super.key, required this.child, this.darken = 0.6});

  final Widget child;
  final double darken;

  @override
  Widget build(BuildContext context) => ClipRect(
        child: ColorFiltered(
            colorFilter: ColorFilter.mode(
                Colors.black.withValues(alpha: darken), BlendMode.modulate)),
      );
}
