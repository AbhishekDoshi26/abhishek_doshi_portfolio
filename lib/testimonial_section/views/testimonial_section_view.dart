import 'package:abhishek_doshi_portfolio/testimonial_section/testimonial_section.dart';
import 'package:abhishek_doshi_portfolio/utils/utils.dart';
import 'package:abhishek_doshi_portfolio/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class TestimonialSectionView extends StatelessWidget {
  const TestimonialSectionView({super.key});
  @override
  Widget build(BuildContext context) {
    double screenWidth = widthOfScreen(context) - (getSidePadding(context));
    double screenHeight = heightOfScreen(context);
    double contentAreaWidth = responsiveSize(
      context,
      screenWidth,
      screenWidth,
      md: screenWidth,
    );

    return Container(
      padding: EdgeInsets.only(left: getSidePadding(context)),
      child: ResponsiveBuilder(
        refinedBreakpoints: const RefinedBreakpoints(),
        builder: (context, sizingInformation) {
          double screenWidth = sizingInformation.screenSize.width;
          if (screenWidth <= 1024) {
            return const TestimonialSection();
          } else {
            return ContentArea(
              width: contentAreaWidth,
              height: screenHeight,
              child: const Column(
                children: [
                  Spacer(),
                  TestimonialSection(),
                  Spacer(flex: 2),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
