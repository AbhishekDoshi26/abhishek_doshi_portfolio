import 'package:abhishek_doshi_portfolio/values/values.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class AnimatedLineThrough extends StatefulWidget {
  const AnimatedLineThrough({
    super.key,
    required this.text,
    this.textStyle,
  });

  final String text;
  final TextStyle? textStyle;

  @override
  State<AnimatedLineThrough> createState() => _AnimatedLineThroughState();
}

class _AnimatedLineThroughState extends State<AnimatedLineThrough>
    with TickerProviderStateMixin {
  bool _isHovering = false;
  bool completed = false;
  late AnimationController controller;
  late Animation animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    final CurvedAnimation curve =
        CurvedAnimation(parent: controller, curve: Curves.easeOut);

    animation = Tween(begin: 0.0, end: 1.0).animate(curve)
      ..addListener(() => setState(() {}));
//    controller.forward(from: 0.0);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (e) => _mouseEnter(true),
      onExit: (e) => _mouseEnter(false),
      child: Stack(
        children: <Widget>[
          Text(
            widget.text,
            style: widget.textStyle,
          ),
          if (_isHovering)
            DefaultTextStyle(
              style: widget.textStyle!.copyWith(
                color: Colors.transparent,
                decorationColor: AppColors.blue300,
                decorationStyle: TextDecorationStyle.solid,
                decoration: TextDecoration.underline,
              ),
              child: AnimatedTextKit(
                isRepeatingAnimation: false,
                animatedTexts: [
                  TypewriterAnimatedText(widget.text),
                ],
              ),
            ),
        ],
      ),
    );
  }

  void _mouseEnter(bool hovering) {
    if (hovering) {
      setState(() {
        controller.forward();
        _isHovering = hovering;
      });
    } else {
      setState(() {
        controller.reverse();
        _isHovering = hovering;
      });
    }
  }
}
