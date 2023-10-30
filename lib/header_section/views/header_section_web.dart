import 'package:abhishek_doshi_portfolio/header_section/header_section.dart';
import 'package:abhishek_doshi_portfolio/router/router.dart';
import 'package:abhishek_doshi_portfolio/utils/utils.dart';
import 'package:abhishek_doshi_portfolio/values/values.dart';
import 'package:abhishek_doshi_portfolio/widgets/widgets.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_builder/responsive_builder.dart';

class HeaderSectionWeb extends StatefulWidget {
  const HeaderSectionWeb({super.key});

  @override
  State<HeaderSectionWeb> createState() => _HeaderSectionWebState();
}

class _HeaderSectionWebState extends State<HeaderSectionWeb>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  static const double bodyTextSizeLg = 16.0;
  static const double bodyTextSizeSm = 14.0;
  static const double socialTextSizeLg = 18.0;
  static const double socialTextSizeSm = 14.0;

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
    double headerIntroTextSize = responsiveSize(
      context,
      Sizes.TEXT_SIZE_24,
      Sizes.TEXT_SIZE_56,
      md: Sizes.TEXT_SIZE_36,
    );
    double bodyTextSize =
        responsiveSize(context, bodyTextSizeSm, bodyTextSizeLg);
    double socialTextSize =
        responsiveSize(context, socialTextSizeSm, socialTextSizeLg);
    double screenWidth = widthOfScreen(context);
    double contentAreaWidth = screenWidth;
    TextStyle? bodyTextStyle =
        textTheme.bodyLarge?.copyWith(fontSize: bodyTextSize);
    TextStyle? socialTitleStyle =
        textTheme.titleMedium?.copyWith(fontSize: socialTextSize);

    List<Widget> cardsForTabletView = CardRow.buildCardRow(
      context: context,
      data: Data.homeCardData,
      width: contentAreaWidth * 0.4,
      isWrap: true,
    );
    double buttonWidth = responsiveSize(
      context,
      80,
      150,
    );
    double buttonHeight = responsiveSize(
      context,
      48,
      60,
      md: 54,
    );

    double sizeOfBlobSm = screenWidth * 0.3;
    double sizeOfGoldenGlobe = screenWidth * 0.2;
    double dottedGoldenGlobeOffset = sizeOfBlobSm * 0.4;
    double heightOfBlobAndGlobe =
        computeHeight(dottedGoldenGlobeOffset, sizeOfGoldenGlobe, sizeOfBlobSm);
    double heightOfStack = heightOfBlobAndGlobe * 2;
    double blobOffset = heightOfStack * 0.3;
    return ContentArea(
      child: Stack(
        children: [
          SizedBox(
            height: heightOfStack,
            child: Stack(
              children: [
                Stack(
                  children: [
                    Positioned(
                      left: -(sizeOfBlobSm * 0.7),
                      top: blobOffset,
                      child: Image.asset(
                        ImagePath.kBlobBlack,
                        height: sizeOfBlobSm,
                        width: sizeOfBlobSm,
                      ),
                    ),
                    Positioned(
                      left: -(sizeOfGoldenGlobe * 0.5),
                      top: blobOffset + dottedGoldenGlobeOffset,
                      child: RotationTransition(
                        turns: _controller,
                        child: Image.asset(
                          ImagePath.kDotsGlobeYeloow,
                          width: sizeOfGoldenGlobe,
                          height: sizeOfGoldenGlobe,
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
                Positioned(
                  right: -(sizeOfBlobSm * 0.8),
                  child: HeaderImage(
                    controller: _controller,
                    globeSize: sizeOfGoldenGlobe,
                    imageHeight: heightOfStack,
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: heightOfStack * 0.05),
                    child: SelectableText(
                      StringConst.FIRST_NAME,
                      style: textTheme.displayLarge?.copyWith(
                        color: AppColors.grey50,
                        fontSize: headerIntroTextSize * 2,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        top: heightOfStack * 0.2, left: (sizeOfBlobSm * 0.35)),
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
                            const SpaceH24(),
                            ConstrainedBox(
                              constraints:
                                  BoxConstraints(maxWidth: screenWidth * 0.35),
                              child: SelectableText(
                                StringConst.ABOUT_DEV,
                                style: bodyTextStyle?.copyWith(height: 1.5),
                              ),
                            ),
                            const SpaceH80(),
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
                                    SelectableText(
                                      StringConst.DEV_EMAIL_2,
                                      style: bodyTextStyle,
                                      onTap: () => context.go(Routes.email),
                                    ),
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
                                      onTap: () => openUrlLink(
                                          StringConst.LINKED_IN_URL),
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
                                  buttonColor: AppColors.primaryColor,
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
                              children: SocialIcons.buildSocialIcons(
                                Data.socialData,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 150),
              Container(
                margin: EdgeInsets.only(left: (sizeOfBlobSm * 0.35)),
                child: ResponsiveBuilder(
                  refinedBreakpoints: const RefinedBreakpoints(),
                  builder: (context, sizingInformation) {
                    double screenWidth = sizingInformation.screenSize.width;
                    if (screenWidth < const RefinedBreakpoints().tabletNormal) {
                      return Container(
                        margin: EdgeInsets.only(right: (sizeOfBlobSm * 0.35)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: CardRow.buildCardRow(
                            context: context,
                            data: Data.homeCardData,
                            width: contentAreaWidth,
                            isHorizontal: false,
                            hasAnimation: false,
                          ),
                        ),
                      );
                    } else if (screenWidth >=
                            const RefinedBreakpoints().tabletNormal &&
                        screenWidth <= 1024) {
                      return Wrap(
                        runSpacing: 24,
                        children: [
                          SizedBox(width: contentAreaWidth * 0.03),
                          cardsForTabletView[0],
                          const SpaceW40(),
                          cardsForTabletView[1],
                          SizedBox(width: contentAreaWidth * 0.03),
                          Center(
                            child: Container(
                              margin: const EdgeInsets.only(top: 20),
                              child: cardsForTabletView[2],
                            ),
                          ),
                        ],
                      );
                    } else {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              ...CardRow.buildCardRow(
                                context: context,
                                data: Data.homeCardData,
                                width: contentAreaWidth / 3.8,
                              ),
                              const Spacer(),
                            ],
                          ),
                        ],
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
