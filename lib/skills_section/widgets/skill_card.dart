import 'package:abhishek_doshi_portfolio/values/values.dart';
import 'package:abhishek_doshi_portfolio/widgets/widgets.dart';
import 'package:flutter/material.dart';

class SkillCardData {
  final String title;
  final String description;
  final IconData iconData;

  SkillCardData({
    required this.title,
    required this.iconData,
    required this.description,
  });
}

class SkillCard extends StatefulWidget {
  const SkillCard({
    super.key,
    this.title = "",
    this.description = "",
    this.titleStyle,
    this.descriptionStyle,
    this.width,
    this.height,
    this.iconSize = 40,
    this.elevation = Sizes.ELEVATION_4,
    this.borderRadius = const BorderRadius.all(Radius.circular(8)),
    this.backgroundColor = AppColors.white,
    this.iconData = Icons.phone,
    this.iconColor = AppColors.white,
    this.iconBackgroundColor = AppColors.black,
    this.child,
    this.onHoverChild,
  });

  final String title;
  final String description;
  final TextStyle? titleStyle;
  final TextStyle? descriptionStyle;
  final double? width;
  final double? height;
  final double iconSize;
  final double elevation;
  final BorderRadius borderRadius;
  final Color backgroundColor;
  final Color iconColor;
  final Color iconBackgroundColor;
  final IconData iconData;
  final Widget? child;
  final Widget? onHoverChild;

  @override
  State<SkillCard> createState() => _SkillCardState();
}

class _SkillCardState extends State<SkillCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      decoration: BoxDecoration(
        borderRadius: widget.borderRadius,
      ),
      child: defaultChild(),
    );
  }

  Widget defaultChild() {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Card(
      color: widget.backgroundColor,
      elevation: widget.elevation,
      shape: RoundedRectangleBorder(borderRadius: widget.borderRadius),
      child: Container(
        key: const Key("default"),
        child: widget.child ??
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularContainer(
                  backgroundColor: widget.iconBackgroundColor,
                  padding: const EdgeInsets.all(16),
                  borderRadius: const BorderRadius.all(Radius.circular(40)),
                  iconData: widget.iconData,
                  iconColor: widget.iconColor,
                  iconSize: widget.iconSize,
                ),
                const SpaceH12(),
                SelectableText(
                  widget.title,
                  textAlign: TextAlign.center,
                  style: widget.titleStyle ?? textTheme.titleMedium,
                ),
              ],
            ),
      ),
    );
  }

  Widget onHoverChild() {
    TextTheme textTheme = Theme.of(context).textTheme;
    return widget.onHoverChild ??
        Stack(
          children: [
            ClipRRect(
              borderRadius: widget.borderRadius,
              child: Opacity(
                opacity: 0.9,
                child: Image.asset(
                  ImagePath.kIconBox,
                  width: widget.width,
                  height: widget.height,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.title,
                    style: widget.titleStyle ??
                        textTheme.titleMedium?.copyWith(
                          color: AppColors.white,
                        ),
                  ),
                  const SpaceH8(),
                  Text(
                    widget.description,
                    style: widget.descriptionStyle ??
                        textTheme.bodyMedium?.copyWith(
                          color: AppColors.primaryText1,
                        ),
                  ),
                ],
              ),
            )
          ],
        );
    // Container(
    //   key: Key("onHover"),
    //   child: Stack(
    //     children: [
    //       Image.asset(
    //         ImagePath.ICON_BOX,
    //         fit: BoxFit.fill,
    //       ),
    //     ],
    //   ),
    // );
  }
}
