import 'package:abhishek_doshi_portfolio/presentation/layout/adaptive.dart';
import 'package:abhishek_doshi_portfolio/presentation/widgets/spaces.dart';
import 'package:abhishek_doshi_portfolio/values/values.dart';
import 'package:flutter/material.dart';

class SkillLevelData {
  final String skill;
  final double level;

  SkillLevelData({
    required this.skill,
    required this.level,
  });
}

class SkillLevel extends StatefulWidget {
  const SkillLevel({
    super.key,
    required this.skill,
    required this.level,
    required this.controller,
    this.skillStyle,
    this.levelStyle,
    this.skillLevelColor = AppColors.blue300,
    this.baseColor = AppColors.grey100,
    this.skillLevelWidth = 100,
    this.baseThickness = 2.0,
    this.skillLevelThickness = 7.0,
    this.curve = Curves.fastOutSlowIn,
  });

  final String skill;
  final double level;
  final TextStyle? skillStyle;
  final TextStyle? levelStyle;
  final Color skillLevelColor;
  final Color baseColor;
  final double skillLevelWidth;
  final double baseThickness;
  final double skillLevelThickness;
  final AnimationController controller;
  final Curve curve;

  @override
  State<SkillLevel> createState() => _SkillLevelState();
}

class _SkillLevelState extends State<SkillLevel> {
  late Animation<double> animation;

  @override
  void initState() {
    animation = Tween(begin: 0.0, end: widget.level).animate(
      CurvedAnimation(
        parent: widget.controller,
        curve: widget.curve,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      child: _buildChild(animation.value),
      builder: (context, _) {
        return _buildChild(animation.value);
      },
    );
  }

  Widget _buildChild(double level) {
    TextTheme textTheme = Theme.of(context).textTheme;
    TextStyle? defaultStyle = textTheme.titleSmall;
    return SizedBox(
      width: widget.skillLevelWidth,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.skill,
                style: widget.skillStyle ?? defaultStyle,
              ),
              Text(
                "${level.toInt()} %",
                style: widget.levelStyle ?? defaultStyle,
              ),
            ],
          ),
          const SpaceH8(),
          Stack(
            children: [
              Container(
                height: widget.baseThickness,
                margin: EdgeInsets.only(
                  top: (widget.skillLevelThickness - widget.baseThickness) / 2,
                ),
                width: widthOfScreen(context),
                color: widget.baseColor,
              ),
              Container(
                height: widget.skillLevelThickness,
                width: widget.skillLevelWidth * (level / 100),
                color: widget.skillLevelColor,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
