import 'package:abhishek_doshi_portfolio/utils/utils.dart';
import 'package:abhishek_doshi_portfolio/values/values.dart';
import 'package:flutter/material.dart';

class AboutMeImage extends StatelessWidget {
  const AboutMeImage({
    super.key,
    required this.height,
    required this.width,
    required this.fadeInAnimation,
    required this.scaleAnimation,
  });

  final double height;
  final double width;
  final Animation<double> fadeInAnimation;
  final Animation<double> scaleAnimation;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    double fontSize = responsiveSize(context, 60, 72, md: 64);
    TextStyle? titleStyle = textTheme.bodyLarge?.merge(
      Styles.customTextStyle3(
        fontSize: fontSize,
        height: 1.25,
        color: AppColors.primaryText2,
      ),
    );

    return Stack(
      children: [
        Positioned(
          left: 0,
          bottom: 0,
          child: ScaleTransition(
            scale: scaleAnimation,
            child: Image.asset(
              ImagePath.kDotsGlobeGrey,
              width: 180,
              height: 180,
            ),
          ),
        ),
        ScaleTransition(
          scale: scaleAnimation,
          child: Image.asset(
            ImagePath.kDevAboutMe,
            width: width * 0.95,
          ),
        ),
        Positioned(
          top: width * 0.2,
          left: width * 0.2,
          child: FadeTransition(
            opacity: fadeInAnimation,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  StringConst.HI,
                  style: titleStyle,
                ),
                Text(
                  StringConst.THERE,
                  style: titleStyle,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
