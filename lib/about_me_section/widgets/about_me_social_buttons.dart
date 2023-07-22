import 'package:abhishek_doshi_portfolio/utils/functions.dart';
import 'package:abhishek_doshi_portfolio/values/values.dart';
import 'package:abhishek_doshi_portfolio/widgets/widgets.dart';
import 'package:flutter/material.dart';

class AboutMeSocialButtons extends StatelessWidget {
  const AboutMeSocialButtons({
    super.key,
    required this.spacing,
    required this.runSpacing,
  });

  final double spacing;
  final double runSpacing;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: spacing,
      runSpacing: runSpacing,
      children: Data.socialData2
          .map(
            (e) => SocialButton2(
              title: e.title.toUpperCase(),
              iconData: e.iconData,
              onPressed: () => openUrlLink(e.url),
              titleColor: e.titleColor,
              buttonColor: e.buttonColor,
              iconColor: e.iconColor,
            ),
          )
          .toList(),
    );
  }
}
