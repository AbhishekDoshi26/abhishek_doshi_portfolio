import 'package:abhishek_doshi_portfolio/presentation/layout/adaptive.dart';
import 'package:abhishek_doshi_portfolio/presentation/widgets/buttons/social_button.dart';
import 'package:abhishek_doshi_portfolio/presentation/widgets/circular_container.dart';
import 'package:abhishek_doshi_portfolio/presentation/widgets/nimbus_card.dart';
import 'package:abhishek_doshi_portfolio/presentation/widgets/nimbus_link.dart';
import 'package:abhishek_doshi_portfolio/presentation/widgets/spaces.dart';
import 'package:abhishek_doshi_portfolio/values/values.dart';
import 'package:flutter/material.dart';

class HeaderImage extends StatefulWidget {
  const HeaderImage({
    Key? key,
    required this.controller,
    this.globeSize = 150,
    this.imageHeight,
    this.imageWidth,
    this.fit,
  }) : super(key: key);

  final double? globeSize;
  final double? imageWidth;
  final double? imageHeight;
  final BoxFit? fit;
  final AnimationController controller;

  @override
  State<HeaderImage> createState() => _HeaderImageState();
}

class _HeaderImageState extends State<HeaderImage> {
  @override
  void dispose() {
    widget.controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          left: 0,
          child: RotationTransition(
            turns: widget.controller,
            child: Image.asset(
              ImagePath.kDotsGlobeGrey,
              height: widget.globeSize,
              width: widget.globeSize,
            ),
          ),
        ),
        Image.asset(
          ImagePath.kDevHeader,
          width: widget.imageWidth,
          height: widget.imageHeight,
          fit: widget.fit,
        ),
      ],
    );
  }
}

List<Widget> buildSocialIcons(List<SocialButtonData> socialItems) {
  List<Widget> items = [];
  for (int index = 0; index < socialItems.length; index++) {
    items.add(
      // InkWell(
      //   onTap: () => openUrlLink(socialItems[index].url),
      //   child: Icon(
      //     socialItems[index].iconData,
      //     color: AppColors.black,
      //     size: Sizes.ICON_SIZE_18,
      //   ),
      // ),
      NimBusLink(
        url: socialItems[index].url,
        child: Icon(
          socialItems[index].iconData,
          color: AppColors.black,
          size: Sizes.ICON_SIZE_18,
        ),
      ),
    );
    items.add(const SpaceW20());
  }
  return items;
}

List<Widget> buildCardRow({
  required BuildContext context,
  required List<NimBusCardData> data,
  required double width,
  bool isHorizontal = true,
  bool isWrap = false,
  bool hasAnimation = true,
}) {
  TextTheme textTheme = Theme.of(context).textTheme;
  List<Widget> items = [];

  double cardWidth = responsiveSize(
    context,
    Sizes.WIDTH_32,
    Sizes.WIDTH_40,
    md: Sizes.WIDTH_36,
  );
  double iconSize = responsiveSize(
    context,
    Sizes.ICON_SIZE_18,
    Sizes.ICON_SIZE_24,
  );
  double trailingIconSize = responsiveSize(
    context,
    Sizes.ICON_SIZE_28,
    Sizes.ICON_SIZE_30,
    md: Sizes.ICON_SIZE_30,
  );
  for (int index = 0; index < data.length; index++) {
    items.add(
      NimBusCard(
        width: width,
        height: responsiveSize(
          context,
          125,
          140,
        ),
        hasAnimation: hasAnimation,
        leading: CircularContainer(
          width: cardWidth,
          height: cardWidth,
          iconSize: iconSize,
          backgroundColor: data[index].circleBgColor,
          iconColor: data[index].leadingIconColor,
        ),
        title: Flexible(
          child: SelectableText(
            data[index].title,
            style: textTheme.titleMedium?.copyWith(
              fontSize: responsiveSize(
                context,
                Sizes.TEXT_SIZE_16,
                Sizes.TEXT_SIZE_18,
              ),
            ),
          ),
        ),
        subtitle: Flexible(
          child: SelectableText(
            data[index].subtitle,
            style: textTheme.bodyLarge?.copyWith(
                fontSize: responsiveSize(
              context,
              Sizes.TEXT_SIZE_14,
              Sizes.TEXT_SIZE_16,
            )),
          ),
        ),
        trailing: Icon(
          Icons.chevron_right,
          size: trailingIconSize,
          color: data[index].trailingIconColor,
        ),
      ),
    );
    //run this only on mobile devices and laptops but not on tablets.
    // We use `Wrap` to make the widgets wrap on the tablet view
    if (!isWrap) {
      if (isHorizontal) {
        items.add(const SpaceW36());
      } else {
        items.add(const SpaceH30());
      }
    }
  }

  return items;
}

double computeHeight(double offset, double sizeOfGlobe, double sizeOfBlob) {
  double sum = (offset + sizeOfGlobe) - sizeOfBlob;
  if (sum < 0) {
    return sizeOfBlob;
  } else {
    return sum + sizeOfBlob;
  }
}
