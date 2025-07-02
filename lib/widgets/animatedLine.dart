import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LineRevealAnimation extends StatefulWidget {
  final String assetPath;
  final double width;
  final double height;
  final Duration duration;

  const LineRevealAnimation({
    required this.assetPath,
    this.width = 300,
    this.height = 100,
    this.duration = const Duration(seconds: 2),
    super.key,
  });

  @override
  State<LineRevealAnimation> createState() => _LineRevealAnimationState();
}

class _LineRevealAnimationState extends State<LineRevealAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: widget.duration,
      vsync: this,
    )..forward();

    _animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return ClipRect(
          child: Align(
            alignment: Alignment.centerLeft,
            widthFactor: _animation.value,
            child: child,
          ),
        );
      },
      child: SvgPicture.asset(
        widget.assetPath,
        width: widget.width,
        height: widget.height,
      ),
    );
  }
}
