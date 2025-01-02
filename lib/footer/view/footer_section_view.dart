import 'package:abhishek_doshi_portfolio/footer/footer.dart';
import 'package:abhishek_doshi_portfolio/router/router.dart';
import 'package:abhishek_doshi_portfolio/utils/utils.dart';
import 'package:abhishek_doshi_portfolio/values/values.dart';
import 'package:abhishek_doshi_portfolio/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:url_launcher/link.dart';
import 'package:url_launcher/url_launcher.dart';

class FooterSectionView extends StatefulWidget {
  const FooterSectionView({super.key});
  @override
  State<FooterSectionView> createState() => _FooterSectionViewState();
}

class _FooterSectionViewState extends State<FooterSectionView> {
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    TextStyle? footerTextStyle = textTheme.bodySmall?.copyWith(
      color: AppColors.primaryText2,
      fontWeight: FontWeight.bold,
    );
    double screenWidth = widthOfScreen(context) - (getSidePadding(context) * 2);
    double screenHeight = heightOfScreen(context);
    double contentAreaWidth = screenWidth;
    double contentAreaHeight = responsiveSize(
      context,
      screenHeight,
      screenHeight * 0.7,
      md: screenHeight * 0.85,
      sm: screenHeight * 0.85,
    );

    return ContentArea(
      padding: EdgeInsets.symmetric(horizontal: getSidePadding(context)),
      child: Column(
        children: [
          ResponsiveBuilder(
            builder: (context, sizingInformation) {
              double screenWidth = sizingInformation.screenSize.width;

              if (screenWidth <= (const RefinedBreakpoints().tabletNormal)) {
                return FooterMobile(
                  width: contentAreaWidth,
                  height: contentAreaHeight,
                );
              } else {
                return FooterWeb(
                  width: contentAreaWidth,
                  height: contentAreaHeight,
                );
              }
            },
          ),
          const SpaceH20(),
          const SpaceH4(),
          Link(
            uri: Uri.parse(StringConst.refrens),
            builder: (context, followLink) {
              return InkWell(
                onTap: () {
                  launchUrl(Uri.parse(StringConst.refrens));
                },
                child: Image.asset(ImagePath.kRefrens, height: 50),
              );
            },
          ),
          Text(
            StringConst.RIGHTS_RESERVED,
            style: footerTextStyle,
          ),
          Center(
            child: InkWell(
              onTap: () => context.go(Routes.linkedin),
              child: RichText(
                text: TextSpan(
                  text: "${StringConst.BUILT_BY} ",
                  style: footerTextStyle,
                  children: [
                    TextSpan(
                      text: StringConst.ABHISHEK_DOSHI,
                      style: footerTextStyle?.copyWith(
                        decoration: TextDecoration.underline,
                        fontWeight: FontWeight.w900,
                        color: AppColors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SpaceH4(),
          const SpaceH20(),
        ],
      ),
    );
  }
}
