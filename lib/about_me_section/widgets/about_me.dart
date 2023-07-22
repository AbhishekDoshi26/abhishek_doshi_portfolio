import 'package:abhishek_doshi_portfolio/about_me_section/about_me_section.dart';
import 'package:abhishek_doshi_portfolio/values/values.dart';
import 'package:abhishek_doshi_portfolio/widgets/widgets.dart';
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
    return Stack(
      children: [
        //positions blob on the far right of the section
        //based on the calculation only 10% of blob is showing
        Positioned(
          top: height * 0.2,
          left: width * 0.90,
          child: ResponsiveBuilder(
            refinedBreakpoints: const RefinedBreakpoints(),
            builder: (context, sizingInformation) {
              double screenWidth = sizingInformation.screenSize.width;
              if (screenWidth < (const RefinedBreakpoints().tabletLarge)) {
                return const Empty();
              } else {
                return Image.asset(
                  ImagePath.kBlobBlack,
                  height: height * 0.30,
                  width: width * 0.30,
                );
              }
            },
          ),
        ),

        ResponsiveBuilder(
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
        ),
      ],
    );
  }
}
