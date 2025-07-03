import 'package:flutter/material.dart';

class DarkenButton extends StatefulWidget {
  const DarkenButton({super.key, required this.child, this.onTap, this.duration, this.darken = 0.6});

  final Widget child;
  final dynamic Function()? onTap;
  final Duration? duration;
  final double darken;

  @override
  State<DarkenButton> createState() => _DarkenButtonState();
}

class _DarkenButtonState extends State<DarkenButton> {
  int _state = -1;

  @override
  Widget build(BuildContext context) => GestureDetector(
    onTapDown: (e) => _pressed(),
    onTapCancel: () => _unfocus(),
    onTapUp: (e) => _unfocus(),
    onTap: widget.onTap,
    child: _state == -1
        ? widget.child
        : ClipRect(
            child: TweenAnimationBuilder(
              tween: _state == 1
                  ? ColorTween(begin: Colors.black, end: Colors.black.withValues(alpha: 0.6))
                  : ColorTween(begin: Colors.black.withValues(alpha: 0.6), end: Colors.black),
              duration: widget.duration ?? Duration(milliseconds: 200),
              builder: (context, color, child) =>
                  ColorFiltered(colorFilter: ColorFilter.mode(color!, BlendMode.dstIn), child: widget.child),
            ),
          ),
  );

  void _pressed() => setState(() {
    _state = 1;
  });

  void _unfocus() => setState(() {
    _state = 2;
  });
}
