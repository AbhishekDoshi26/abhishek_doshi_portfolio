import 'package:abhishek_doshi_portfolio/presentation/layout/adaptive.dart';
import 'package:abhishek_doshi_portfolio/presentation/widgets/buttons/nimbus_button_link.dart';
import 'package:abhishek_doshi_portfolio/presentation/widgets/content_area.dart';
import 'package:abhishek_doshi_portfolio/presentation/widgets/spaces.dart';
import 'package:abhishek_doshi_portfolio/utils/functions.dart';
import 'package:abhishek_doshi_portfolio/values/values.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:responsive_builder/responsive_builder.dart';

List<FooterItem> footerItems = [
  const FooterItem(
    title: "${StringConst.PHONE_ME}:",
    subtitle: StringConst.PHONE_NUMBER,
    iconData: FeatherIcons.phone,
    url: StringConst.PHONE_NUMBER_URL,
  ),
  const FooterItem(
    title: "${StringConst.MAIL_ME}:",
    subtitle: StringConst.DEV_EMAIL_2,
    iconData: FontAwesomeIcons.paperPlane,
    url: StringConst.EMAIL_URL,
  ),
  const FooterItem(
    title: "${StringConst.FOLLOW_ME_2}:",
    subtitle: StringConst.LinkedInId,
    iconData: FontAwesomeIcons.linkedinIn,
    url: StringConst.LINKED_IN_URL,
  ),
];

class FooterSection extends StatefulWidget {
  const FooterSection({super.key});
  @override
  State<FooterSection> createState() => _FooterSectionState();
}

class _FooterSectionState extends State<FooterSection> {
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
                return _buildFooterSectionSm(
                  width: contentAreaWidth,
                  height: contentAreaHeight,
                );
              } else {
                return _buildFooterSectionLg(
                  width: contentAreaWidth,
                  height: contentAreaHeight,
                );
              }
            },
          ),
          const SpaceH20(),
          Text(
            StringConst.RIGHTS_RESERVED,
            style: footerTextStyle,
          ),
          Center(
            child: InkWell(
              onTap: () => openUrlLink(StringConst.LINKED_IN_URL),
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
            //  NimBusLink(
            //   url: StringConst.DAVID_LEGEND_URL,
            //   child: RichText(
            //     text: TextSpan(
            //       text: StringConst.BUILT_BY + " ",
            //       style: footerTextStyle,
            //       children: [
            //         TextSpan(
            //           text: StringConst.DAVID_COBBINA + ". ",
            //           style: footerTextStyle?.copyWith(
            //             decoration: TextDecoration.underline,
            //             fontWeight: FontWeight.w900,
            //             color: AppColors.black,
            //           ),
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
          ),
          const SpaceH4(),
          const SpaceH20(),
        ],
      ),
    );
  }

  List<Widget> _buildFooterItems(List<FooterItem> data,
      {bool isHorizontal = false}) {
    List<Widget> items = [];

    for (int index = 0; index < data.length; index++) {
      items.add(
        FooterItem(
          title: data[index].title,
          subtitle: data[index].subtitle,
          iconData: data[index].iconData,
          url: data[index].url,
        ),
      );
      if (index < data.length - 1) {
        if (isHorizontal) {
          items.add(const Spacer(flex: 2));
        } else {
          items.add(const SpaceH40());
        }
      }
    }
    return items;
  }

  Widget _buildFooterSectionSm({
    required double width,
    required double height,
  }) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return ContentArea(
      width: width,
      backgroundColor: AppColors.black400,
      borderRadius: const BorderRadius.all(
        Radius.circular(Sizes.RADIUS_8),
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(
          Radius.circular(Sizes.RADIUS_8),
        ),
        child: Stack(
          children: [
            Positioned(
              top: -(height * 0.1),
              left: -(height * 0.15),
              child: Image.asset(
                ImagePath.kBoxCoverGold,
                height: height * 0.5,
                color: AppColors.primaryColor,
              ),
            ),
            Positioned(
              bottom: -(height * 0.1),
              right: -(height * 0.1),
              child: Image.asset(
                ImagePath.kBoxCoverBlack,
                height: height * 0.6,
                fit: BoxFit.cover,
              ),
            ),
            Center(
              child: Column(
                children: [
                  const SpaceH80(),
                  Text(
                    StringConst.LETS_TALK,
                    textAlign: TextAlign.center,
                    style: textTheme.headlineMedium
                        ?.copyWith(color: AppColors.white),
                  ),
                  const SpaceH60(),
                  ..._buildFooterItems(footerItems),
                  const SpaceH60(),
                  const NimBusButtonLink(
                    url: StringConst.EMAIL_URL,
                    buttonTitle: StringConst.HIRE_ME,
                    buttonColor: AppColors.primaryColor,
                  ),
                  const SpaceH80(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFooterSectionLg({
    required double width,
    required double height,
  }) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return ContentArea(
      width: width,
      height: height,
      backgroundColor: AppColors.black400,
      borderRadius: const BorderRadius.all(
        Radius.circular(Sizes.RADIUS_8),
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(
          Radius.circular(Sizes.RADIUS_8),
        ),
        child: Stack(
          children: [
            Positioned(
              top: -(height * 0.15),
              left: -(height * 0.15),
              child: Image.asset(
                ImagePath.kBoxCoverGold,
                height: height * 0.5,
                color: AppColors.primaryColor,
              ),
            ),
            Positioned(
              top: -(height * 0.15),
              right: -(height * 0.1),
              // bottom: -25,
              child: Image.asset(
                ImagePath.kBoxCoverBlack,
                height: height * 1.25,
                fit: BoxFit.cover,
              ),
            ),
            Column(
              children: [
                const Spacer(flex: 2),
                Text(
                  StringConst.LETS_TALK,
                  style:
                      textTheme.displaySmall?.copyWith(color: AppColors.white),
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Spacer(flex: 3),
                    ..._buildFooterItems(footerItems, isHorizontal: true),
                    const Spacer(flex: 3),
                  ],
                ),
                const Spacer(),
                const NimBusButtonLink(
                  url: StringConst.EMAIL_URL,
                  buttonTitle: StringConst.HIRE_ME,
                  buttonColor: AppColors.primaryColor,
                ),
                const Spacer(flex: 2),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class FooterItem extends StatelessWidget {
  const FooterItem({
    super.key,
    required this.iconData,
    required this.title,
    required this.subtitle,
    required this.url,
  });

  final String title;
  final String subtitle;
  final IconData iconData;
  final String url;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Column(
      children: [
        Icon(
          iconData,
          color: AppColors.primaryColor,
          size: Sizes.ICON_SIZE_36,
        ),
        const SpaceH8(),
        Text(
          title,
          style: textTheme.titleMedium?.copyWith(
            color: AppColors.white,
          ),
        ),
        const SpaceH8(),
        InkWell(
          onTap: () => openUrlLink(url),
          child: Text(
            subtitle,
            style: textTheme.bodyLarge?.copyWith(
              color: AppColors.grey250,
            ),
          ),
        ),
      ],
    );
  }
}
