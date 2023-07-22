import 'package:abhishek_doshi_portfolio/values/values.dart';
import 'package:flutter/material.dart';

class SelectedIndicator extends StatelessWidget {
  const SelectedIndicator({
    super.key,
    required this.width,
    this.indicatorColor = AppColors.primaryColor,
    this.height = Sizes.SIZE_6,
    this.opacity = 0.85,
  });

  final Color indicatorColor;
  final double width;
  final double height;
  final double opacity;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: opacity,
      child: Container(
        width: width,
        height: height,
        color: indicatorColor,
      ),
    );
  }
}
