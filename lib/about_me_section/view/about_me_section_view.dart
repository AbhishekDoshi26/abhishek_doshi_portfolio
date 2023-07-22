import 'package:abhishek_doshi_portfolio/about_me_section/about_me_section.dart';
import 'package:abhishek_doshi_portfolio/utils/utils.dart';
import 'package:abhishek_doshi_portfolio/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:visibility_detector/visibility_detector.dart';

class AboutMeSectionView extends StatefulWidget {
  const AboutMeSectionView({super.key});
  @override
  State<AboutMeSectionView> createState() => _AboutMeSectionViewState();
}

class _AboutMeSectionViewState extends State<AboutMeSectionView>
    with TickerProviderStateMixin {
  late AnimationController _scaleController;
  late Animation<double> _scaleAnimation;
  late AnimationController _fadeInController;
  late Animation<double> _fadeInAnimation;

  @override
  void initState() {
    super.initState();
    _scaleController = AnimationController(
      duration: const Duration(milliseconds: 750),
      vsync: this,
    );
    _fadeInController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    _scaleAnimation = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _scaleController,
        curve: Curves.fastOutSlowIn,
      ),
    );
    _fadeInAnimation = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _fadeInController,
        curve: Curves.fastOutSlowIn,
      ),
    );

    _scaleController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _fadeInController.forward();
      }
    });
  }

  @override
  void dispose() {
    _scaleController.dispose();
    _fadeInController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = widthOfScreen(context) - getSidePadding(context);
    double screenHeight = heightOfScreen(context);
    double contentAreaWidthSm = screenWidth * 1.0;
    double contentAreaHeightSm = screenHeight * 0.6;
    double contentAreaWidthLg = screenWidth * 0.5;

    return VisibilityDetector(
      key: const Key('about-section'),
      onVisibilityChanged: (visibilityInfo) {
        double visiblePercentage = visibilityInfo.visibleFraction * 100;
        if (visiblePercentage > 25) {
          _scaleController.forward();
        }
      },
      child: Container(
        padding: EdgeInsets.only(left: getSidePadding(context)),
        child: ResponsiveBuilder(
          refinedBreakpoints: const RefinedBreakpoints(),
          builder: (context, sizingInformation) {
            double screenWidth = sizingInformation.screenSize.width;
            if (screenWidth < (const RefinedBreakpoints().tabletLarge)) {
              return Column(
                children: [
                  ContentArea(
                    width: contentAreaWidthSm,
                    child: AboutMeImage(
                      width: contentAreaWidthSm,
                      height: contentAreaHeightSm,
                      fadeInAnimation: _fadeInAnimation,
                      scaleAnimation: _scaleAnimation,
                    ),
                  ),
                  const SpaceH40(),
                  ContentArea(
                    width: contentAreaWidthSm,
                    child: AboutMe(
                      width: contentAreaWidthSm,
                      height: screenHeight,
                    ),
                  ),
                ],
              );
            } else {
              return Row(
                children: [
                  ContentArea(
                    width: contentAreaWidthLg,
                    child: AboutMeImage(
                      width: contentAreaWidthLg,
                      height: screenHeight,
                      fadeInAnimation: _fadeInAnimation,
                      scaleAnimation: _scaleAnimation,
                    ),
                  ),
                  ContentArea(
                    width: contentAreaWidthLg,
                    child: AboutMe(
                      width: contentAreaWidthLg,
                      height: screenHeight,
                    ),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
