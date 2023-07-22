import 'package:abhishek_doshi_portfolio/values/values.dart';
import 'package:flutter/material.dart';

class ContentArea extends StatelessWidget {
  final double? width;
  final double? height;
  final Color? backgroundColor;
  final EdgeInsetsGeometry? padding;
  final BoxDecoration? decoration;
  final BorderRadius borderRadius;
  final Widget? child;

  const ContentArea({
    super.key,
    this.width,
    this.height,
    this.backgroundColor,
    this.padding,
    this.decoration,
    this.borderRadius = const BorderRadius.all(
      Radius.circular(Sizes.RADIUS_0),
    ),
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      width: width,
      height: height,
      decoration: decoration ??
          BoxDecoration(
            color: backgroundColor,
            borderRadius: borderRadius,
          ),
      child: child,
    );
  }
}
