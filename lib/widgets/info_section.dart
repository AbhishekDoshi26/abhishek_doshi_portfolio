import 'package:abhishek_doshi_portfolio/utils/utils.dart';
import 'package:abhishek_doshi_portfolio/values/values.dart';
import 'package:abhishek_doshi_portfolio/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class InfoSection1 extends StatelessWidget {
  final String sectionTitle;
  final String title1;
  final String title2;
  final bool hasTitle2;
  final String body;
  final TextStyle? sectionTitleStyle;
  final TextStyle? title1Style;
  final TextStyle? title2Style;
  final TextStyle? bodyStyle;
  final Color dividerColor;
  final double? thickness;
  final int quarterTurns;
  final double dividerHeight;
  final Widget? child;
  final Widget? trailing;

  const InfoSection1({
    super.key,
    required this.sectionTitle,
    required this.title1,
    required this.body,
    this.title2 = "",
    this.sectionTitleStyle,
    this.title1Style,
    this.hasTitle2 = true,
    this.title2Style,
    this.bodyStyle,
    this.thickness = 1.15,
    this.quarterTurns = 3,
    this.dividerColor = AppColors.grey350,
    this.dividerHeight = Sizes.HEIGHT_40,
    this.child,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    TextStyle? titleStyle = textTheme.displaySmall?.copyWith(
      fontSize: responsiveSize(context, 26, 36, md: 32),
    );
    double fontSize = responsiveSize(context, 16, 18);
    return IntrinsicHeight(
      child: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              RotatedBox(
                quarterTurns: quarterTurns,
                child: Text(
                  sectionTitle,
                  style: textTheme.bodyMedium?.copyWith(
                    fontSize: fontSize,
                    fontWeight: FontWeight.w400,
                    color: AppColors.grey250,
                  ),
                ),
              ),
              const SpaceH16(),
              SizedBox(
                height: dividerHeight,
                child: VerticalDivider(
                  color: dividerColor,
                  thickness: thickness,
                ),
              ),
            ],
          ),
          const SpaceW16(),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      title1,
                      style: title1Style ?? titleStyle,
                    ),
                    if (trailing != null &&
                        widthOfScreen(context) >
                            const RefinedBreakpoints().tabletSmall)
                      const SizedBox(width: 20),
                    if (trailing != null &&
                        widthOfScreen(context) >
                            const RefinedBreakpoints().tabletSmall)
                      trailing!,
                  ],
                ),
                if (trailing != null &&
                    widthOfScreen(context) <
                        const RefinedBreakpoints().tabletSmall)
                  trailing!,
                hasTitle2
                    ? SizedBox(
                        height: responsiveSize(
                          context,
                          Sizes.HEIGHT_4,
                          Sizes.HEIGHT_16,
                          md: Sizes.HEIGHT_8,
                        ),
                      )
                    : const Empty(),
                hasTitle2
                    ? Text(
                        title2,
                        style: title2Style ?? titleStyle,
                      )
                    : const Empty(),
                const SpaceH20(),
                Text(
                  body,
                  style: textTheme.bodyLarge
                      ?.copyWith(fontSize: fontSize, height: 1.8),
                ),
                child != null ? const SpaceH30() : const Empty(),
                child ?? const Empty(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class InfoSection2 extends StatelessWidget {
  final String sectionTitle;
  final String title1;
  final String title2;
  final bool hasTitle2;
  final String body;
  final TextStyle? sectionTitleStyle;
  final TextStyle? title1Style;
  final TextStyle? title2Style;
  final TextStyle? bodyStyle;
  final Color dividerColor;
  final double? thickness;
  final double dividerWidth;
  final Widget? child;

  const InfoSection2({
    super.key,
    required this.sectionTitle,
    required this.title1,
    required this.body,
    this.title2 = "",
    this.sectionTitleStyle,
    this.title1Style,
    this.hasTitle2 = true,
    this.title2Style,
    this.bodyStyle,
    this.thickness = 1.15,
    this.dividerColor = AppColors.grey350,
    this.dividerWidth = Sizes.HEIGHT_64,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    TextStyle? titleStyle = textTheme.displaySmall?.copyWith(
      fontSize: responsiveSize(context, 26, 48, md: 32),
    );
    double fontSize = responsiveSize(context, 16, 18);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: dividerWidth,
              child: Divider(
                color: dividerColor,
                thickness: thickness,
              ),
            ),
            const SpaceW16(),
            Text(
              sectionTitle,
              style: textTheme.bodyMedium?.copyWith(
                fontSize: fontSize,
                fontWeight: FontWeight.w400,
                color: AppColors.grey250,
              ),
            ),
          ],
        ),
        const SpaceH16(),
        Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title1,
              style: title1Style ?? titleStyle,
            ),
            hasTitle2
                ? SizedBox(
                    height: responsiveSize(
                      context,
                      Sizes.HEIGHT_4,
                      Sizes.HEIGHT_16,
                      md: Sizes.HEIGHT_8,
                    ),
                  )
                : const Empty(),
            hasTitle2
                ? Text(
                    title2,
                    style: title2Style ?? titleStyle,
                  )
                : const Empty(),
            const SpaceH20(),
            Text(
              body,
              style: textTheme.bodyLarge
                  ?.copyWith(fontSize: fontSize, height: 1.8),
            ),
            child != null ? const SpaceH30() : const Empty(),
            child ?? const Empty(),
          ],
        ),
      ],
    );
  }
}
