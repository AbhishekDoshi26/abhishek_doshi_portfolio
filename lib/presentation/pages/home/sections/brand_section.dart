import 'package:abhishek_doshi_portfolio/presentation/layout/adaptive.dart';
import 'package:abhishek_doshi_portfolio/presentation/widgets/buttons/nimbus_button.dart';
import 'package:abhishek_doshi_portfolio/presentation/widgets/skill_card.dart';
import 'package:abhishek_doshi_portfolio/presentation/widgets/spaces.dart';
import 'package:abhishek_doshi_portfolio/values/values.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:responsive_builder/responsive_builder.dart';

class BrandSection extends StatelessWidget {
  const BrandSection({super.key});
  CarouselOptions carouselOptions({
    bool autoPlay = true,
    bool enlargeCenterPage = false,
    double viewportFraction = 1.0,
    double aspectRatio = 0.1,
    int initialPage = 2,
    ScrollPhysics? scrollPhysics = const NeverScrollableScrollPhysics(),
  }) {
    return CarouselOptions(
      autoPlay: autoPlay,
      enlargeCenterPage: enlargeCenterPage,
      viewportFraction: viewportFraction,
      aspectRatio: aspectRatio,
      initialPage: initialPage,
      scrollPhysics: scrollPhysics,
    );
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    double heightOfCarouselSm = assignWidth(context, 0.40);
    double widthOfCarouselMd = assignWidth(context, 0.33);
    double heightOfCarouselMd = widthOfCarouselMd / 2;
    double heightOfCarouselLg = 150;
    return Column(
      children: [
        Text(
          StringConst.BRANDS_SECTION_TITLE,
          textAlign: TextAlign.center,
          style: textTheme.headlineMedium,
        ),
        const SpaceH40(),
        ResponsiveBuilder(
          builder: (context, sizingInformation) {
            double screenWidth = sizingInformation.screenSize.width;
            if (screenWidth <= (const RefinedBreakpoints().tabletSmall)) {
              return SizedBox(
                height: heightOfCarouselSm,
                width: widthOfScreen(context),
                child: CarouselSlider.builder(
                  itemCount: 15,
                  itemBuilder: (
                    BuildContext context,
                    int itemIndex,
                    int pageViewIndex,
                  ) {
                    return SkillCard(
                      width: assignWidth(context, 0.7),
                      height: heightOfCarouselSm,
                      iconData: FontAwesomeIcons.twitter,
                      title: "Brand",
                    );
                  },
                  options: carouselOptions(),
                ),
              );
            } else if (screenWidth < 1400) {
              return SizedBox(
                height: heightOfCarouselMd,
                width: widthOfScreen(context),
                child: CarouselSlider.builder(
                  itemCount: 15,
                  itemBuilder: (
                    BuildContext context,
                    int itemIndex,
                    int pageViewIndex,
                  ) {
                    return SkillCard(
                      width: widthOfCarouselMd,
                      height: heightOfCarouselMd,
                      iconData: FontAwesomeIcons.twitter,
                      title: "Brand",
                    );
                  },
                  options: carouselOptions(viewportFraction: 0.2),
                ),
              );
            } else {
              return SizedBox(
                height: heightOfCarouselLg,
                width: widthOfScreen(context),
                child: CarouselSlider.builder(
                  itemCount: 15,
                  itemBuilder: (
                    BuildContext context,
                    int itemIndex,
                    int pageViewIndex,
                  ) {
                    return SkillCard(
                      width: 200,
                      height: heightOfCarouselLg,
                      iconData: FontAwesomeIcons.twitter,
                      title: "Brand",
                    );
                  },
                  options: carouselOptions(viewportFraction: 0.15),
                ),
              );
            }
          },
        ),
        const SpaceH40(),
        Align(
          alignment: Alignment.center,
          child: NimbusButton(
            buttonTitle: StringConst.HIRE_ME,
            buttonColor: AppColors.primaryColor,
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}
