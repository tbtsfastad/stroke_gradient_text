import 'package:flutter/material.dart';

class StrokeAndGradientText extends StatelessWidget {
  const StrokeAndGradientText({
    super.key,
    this.strokeCap = StrokeCap.round,
    this.strokeJoin = StrokeJoin.round,
    this.strokeWidth,
    this.strokeColor,
    required this.child,
    this.gradient,
  });

  final StrokeCap strokeCap;
  final StrokeJoin strokeJoin;
  final double? strokeWidth;
  final Color? strokeColor;
  final Text child;
  final Gradient? gradient;

  @override
  Widget build(BuildContext context) {
    TextStyle style;
    if (child.style != null) {
      style = child.style!.copyWith(
        foreground: Paint()
          ..style = PaintingStyle.stroke
          ..strokeCap = strokeCap
          ..strokeJoin = strokeJoin
          ..strokeWidth = strokeWidth ?? 0
          ..color = strokeColor ?? Colors.transparent,
        color: null,
      );
    } else {
      style = TextStyle(
        foreground: Paint()
          ..style = PaintingStyle.stroke
          ..strokeCap = strokeCap
          ..strokeJoin = strokeJoin
          ..strokeWidth = strokeWidth ?? 0
          ..color = strokeColor ?? Colors.transparent,
      );
    }
    return Stack(
      alignment: Alignment.center,
      textDirection: child.textDirection,
      children: <Widget>[
        Text(
          child.data!,
          style: style,
          maxLines: child.maxLines,
          overflow: child.overflow,
          semanticsLabel: child.semanticsLabel,
          softWrap: child.softWrap,
          strutStyle: child.strutStyle,
          textAlign: child.textAlign,
          textDirection: child.textDirection,
          textScaleFactor: child.textScaleFactor,
        ),
        gradient != null
            ? ShaderMask(
                shaderCallback: (r) => gradient!.createShader(r),
                blendMode: BlendMode.srcIn,
                child: child,
              )
            : child,
      ],
    );
  }
}
