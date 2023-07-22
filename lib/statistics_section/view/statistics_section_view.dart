import 'package:abhishek_doshi_portfolio/statistics_section/statistics_section.dart';
import 'package:abhishek_doshi_portfolio/utils/utils.dart';
import 'package:abhishek_doshi_portfolio/values/values.dart';
import 'package:abhishek_doshi_portfolio/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:visibility_detector/visibility_detector.dart';

class StatisticsSectionView extends StatefulWidget {
  const StatisticsSectionView({super.key});
  @override
  State<StatisticsSectionView> createState() => _StatisticsSectionViewState();
}

class _StatisticsSectionViewState extends State<StatisticsSectionView>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double contentAreaWidth =
        widthOfScreen(context) - (getSidePadding(context) * 2);
    return VisibilityDetector(
      key: const Key('statistics-section'),
      onVisibilityChanged: (visibilityInfo) {
        double visiblePercentage = visibilityInfo.visibleFraction * 100;
        if (visiblePercentage > 30) {
          _controller.forward();
        }
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: getSidePadding(context)),
        child: Card(
          elevation: Sizes.ELEVATION_4,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(Sizes.RADIUS_10),
            ),
          ),
          color: AppColors.black400,
          child: ResponsiveBuilder(
            refinedBreakpoints: const RefinedBreakpoints(),
            builder: (context, sizingInformation) {
              double screenWidth = sizingInformation.screenSize.width;
              if (screenWidth < (const RefinedBreakpoints().tabletLarge)) {
                return Container(
                  width: contentAreaWidth,
                  padding:
                      const EdgeInsets.symmetric(vertical: Sizes.PADDING_40),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const SpaceH30(),
                      ..._buildItems(Data.statItemsData),
                      const SpaceH30(),
                    ],
                  ),
                );
              } else {
                return ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(Sizes.RADIUS_10),
                    bottomRight: Radius.circular(Sizes.RADIUS_10),
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        top: -75,
                        left: -50,
                        child: Image.asset(
                          ImagePath.kBoxCoverGold,
                          height: 200,
                          color: AppColors.primaryColor,
                        ),
                      ),
                      Positioned(
                        right: -25,
                        bottom: -25,
                        child: Image.asset(
                          ImagePath.kBoxCoverBlack,
                          height: 200,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: Sizes.PADDING_40),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const Spacer(),
                            ..._buildItems(Data.statItemsData,
                                isHorizontal: true),
                            const Spacer(),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }

  List<Widget> _buildItems(
    List<StatItemData> data, {
    bool isHorizontal = false,
  }) {
    List<Widget> items = [];
    for (int index = 0; index < data.length; index++) {
      items.add(
        StatItem(
          title: data[index].value,
          subtitle: data[index].subtitle,
          controller: _controller,
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
}

class StatItem extends StatelessWidget {
  StatItem({
    super.key,
    required this.title,
    required this.subtitle,
    required this.controller,
    this.titleColor = AppColors.white,
    this.subtitleColor = AppColors.grey150,
    this.titleStyle,
    this.subtitleStyle,
    this.curve = Curves.easeIn,
  });

  final int title;
  final String subtitle;
  final Color titleColor;
  final Color subtitleColor;
  final TextStyle? titleStyle;
  final TextStyle? subtitleStyle;
  final AnimationController controller;
  final Curve curve;

  late final Animation<int> animation = IntTween(begin: 0, end: title).animate(
    CurvedAnimation(
      parent: controller,
      curve: curve,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        return _buildChild(
          context: context,
          value: animation.value,
        );
      },
    );
  }

  Widget _buildChild({
    required BuildContext context,
    required int value,
  }) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Column(
      children: [
        Text(
          "$value",
          style: titleStyle ??
              textTheme.displaySmall?.copyWith(
                color: titleColor,
              ),
        ),
        const SpaceH12(),
        Text(
          subtitle,
          style: subtitleStyle ??
              textTheme.bodyLarge?.copyWith(
                color: subtitleColor,
                fontSize: 16,
              ),
        ),
      ],
    );
  }
}
