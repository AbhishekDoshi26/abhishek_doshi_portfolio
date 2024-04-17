import 'package:abhishek_doshi_portfolio/header_section/header_section.dart';
import 'package:abhishek_doshi_portfolio/router/router.dart';
import 'package:abhishek_doshi_portfolio/utils/utils.dart';
import 'package:abhishek_doshi_portfolio/values/values.dart';
import 'package:abhishek_doshi_portfolio/widgets/widgets.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HeaderSectionMobile extends StatefulWidget {
  const HeaderSectionMobile({super.key});

  @override
  State<HeaderSectionMobile> createState() => _HeaderSectionMobileState();
}

class _HeaderSectionMobileState extends State<HeaderSectionMobile>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  static const double bodyTextSizeSm = 12.0;
  static const double socialTextSizeSm = 14.0;
  static const double sidePadding = Sizes.PADDING_16;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 20),
      vsync: this,
    )..repeat();

    _controller.forward();
    _controller.addListener(() {
      if (_controller.status == AnimationStatus.completed) {
        _controller.reset();
        _controller.forward();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    double headerIntroTextSize = Sizes.TEXT_SIZE_22;
    double screenWidth = widthOfScreen(context) - (sidePadding * 2);
    double contentAreaWidth = screenWidth;
    TextStyle? bodyTextStyle =
        textTheme.bodyLarge?.copyWith(fontSize: bodyTextSizeSm);
    TextStyle? socialTitleStyle =
        textTheme.titleMedium?.copyWith(fontSize: socialTextSizeSm);

    double buttonWidth = 80;
    double buttonHeight = 48;

    double sizeOfBlobSm = screenWidth * 0.4;
    double sizeOfGoldenGlobe = screenWidth * 0.3;
    double dottedGoldenGlobeOffset = sizeOfBlobSm * 0.4;
    double heightOfBlobAndGlobe =
        computeHeight(dottedGoldenGlobeOffset, sizeOfGoldenGlobe, sizeOfBlobSm);
    double heightOfStack = heightOfBlobAndGlobe * 2;

    return ContentArea(
      child: Stack(
        children: [
          Positioned(
            right: -(sizeOfBlobSm),
            child: HeaderImage(
              controller: _controller,
              globeSize: sizeOfGoldenGlobe,
              imageHeight: heightOfStack,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: heightOfStack * 0.1),
                    child: SelectableText(
                      StringConst.FIRST_NAME,
                      style: textTheme.displayLarge?.copyWith(
                        color: AppColors.grey50,
                        fontSize: headerIntroTextSize * 2.5,
                      ),
                    ),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: sidePadding),
                    margin: EdgeInsets.only(top: heightOfStack * 0.3),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ConstrainedBox(
                              constraints:
                                  BoxConstraints(maxWidth: screenWidth),
                              child: AnimatedTextKit(
                                animatedTexts: [
                                  TypewriterAnimatedText(
                                    StringConst.INTRO,
                                    speed: const Duration(milliseconds: 60),
                                    textStyle:
                                        textTheme.displayMedium?.copyWith(
                                      fontSize: headerIntroTextSize,
                                    ),
                                  ),
                                ],
                                onTap: () {},
                                isRepeatingAnimation: true,
                                totalRepeatCount: 5,
                              ),
                            ),
                            ConstrainedBox(
                              constraints:
                                  BoxConstraints(maxWidth: screenWidth),
                              child: AnimatedTextKit(
                                animatedTexts: [
                                  TypewriterAnimatedText(
                                    StringConst.POSITION,
                                    speed: const Duration(milliseconds: 80),
                                    textStyle:
                                        textTheme.displayMedium?.copyWith(
                                      fontSize: headerIntroTextSize,
                                      color: AppColors.blue300,
                                      height: 1.2,
                                    ),
                                  ),
                                ],
                                onTap: () {},
                                isRepeatingAnimation: true,
                                totalRepeatCount: 5,
                              ),
                            ),
                            const SpaceH16(),
                            ConstrainedBox(
                              constraints:
                                  BoxConstraints(maxWidth: screenWidth * 0.5),
                              child: SelectableText(
                                StringConst.ABOUT_DEV,
                                style: bodyTextStyle?.copyWith(
                                  height: 1.5,
                                  // color: AppColors.black,
                                ),
                              ),
                            ),
                            const SpaceH30(),
                            Wrap(
                              // mainAxisSize: MainAxisSize.min,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SelectableText(
                                      "${StringConst.EMAIL}:",
                                      style: socialTitleStyle,
                                    ),
                                    const SpaceH8(),
                                    SelectableText(StringConst.DEV_EMAIL_2,
                                        style: bodyTextStyle, onTap: () {
                                      context.go(Routes.email);
                                    }),
                                  ],
                                ),
                                const SpaceW16(),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SelectableText(
                                      "${StringConst.LINKEDIN}:",
                                      style: socialTitleStyle,
                                    ),
                                    const SpaceH8(),
                                    SelectableText(
                                      StringConst.LINKEDIN_URL_SHORT,
                                      style: bodyTextStyle,
                                      onTap: () {
                                        context.go(Routes.linkedin);
                                      },
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SpaceH40(),
                            Row(
                              children: [
                                PortfolioButton(
                                  width: buttonWidth,
                                  height: buttonHeight,
                                  buttonTitle: StringConst.DOWNLOAD_CV,
                                  opensUrl: true,
                                  url: StringConst.CV_URL,
                                ),
                                const SpaceW16(),
                                PortfolioButton(
                                  width: buttonWidth,
                                  height: buttonHeight,
                                  buttonTitle: StringConst.HIRE_ME_NOW,
                                  opensUrl: true,
                                  url: StringConst.EMAIL_URL,
                                ),
                              ],
                            ),
                            const SpaceH30(),
                            Wrap(
                              children:
                                  SocialIcons.buildSocialIcons(Data.socialData),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SpaceH40(),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: sidePadding,
                ),
                child: Column(
                  children: CardRow.buildCardRow(
                    context: context,
                    data: Data.homeCardData,
                    width: contentAreaWidth,
                    isHorizontal: false,
                    hasAnimation: false,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
