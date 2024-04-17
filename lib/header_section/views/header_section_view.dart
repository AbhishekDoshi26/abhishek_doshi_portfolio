import 'package:abhishek_doshi_portfolio/header_section/header_section.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class HeaderSectionView extends StatelessWidget {
  const HeaderSectionView({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      refinedBreakpoints: const RefinedBreakpoints(),
      builder: (context, sizingInformation) {
        double screenWidth = sizingInformation.screenSize.width;
        if (screenWidth <= const RefinedBreakpoints().tabletSmall) {
          return const HeaderSectionMobile();
        } else {
          return const HeaderSectionWeb();
        }
      },
    );
  }
}
