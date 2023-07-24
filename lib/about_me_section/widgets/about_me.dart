import 'package:abhishek_doshi_portfolio/about_me_section/about_me_section.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class AboutMe extends StatelessWidget {
  const AboutMe({
    super.key,
    required this.height,
    required this.width,
  });

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      refinedBreakpoints: const RefinedBreakpoints(),
      builder: (context, sizingInformation) {
        double screenWidth = sizingInformation.screenSize.width;
        if (screenWidth < (const RefinedBreakpoints().tabletNormal)) {
          return const InfoSectionMobile();
        } else {
          return SizedBox(
            width: width * 0.85,
            child: const InfoSectionWeb(),
          );
        }
      },
    );
  }
}
