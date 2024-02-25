import 'package:abhishek_doshi_portfolio/header_section/header_section.dart';
import 'package:abhishek_doshi_portfolio/router/routes.dart';
import 'package:abhishek_doshi_portfolio/testimonial_section/testimonial_section.dart';
import 'package:abhishek_doshi_portfolio/utils/utils.dart';
import 'package:abhishek_doshi_portfolio/values/values.dart';
import 'package:abhishek_doshi_portfolio/widgets/widgets.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:visibility_detector/visibility_detector.dart';

class TestimonialSectionView extends StatefulWidget {
  const TestimonialSectionView({super.key});
  @override
  State<TestimonialSectionView> createState() => _TestimonialSectionViewState();
}

class _TestimonialSectionViewState extends State<TestimonialSectionView>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool text1InView = false;
  bool text2InView = false;

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
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = widthOfScreen(context) - (getSidePadding(context));
    double screenHeight = heightOfScreen(context);
    double contentAreaWidth = responsiveSize(
      context,
      screenWidth,
      screenWidth,
      md: screenWidth,
    );
    double contentAreaHeight = screenHeight * 0.9;
    return VisibilityDetector(
      key: const Key('testimonial-section'),
      onVisibilityChanged: (visibilityInfo) {
        double visiblePercentage = visibilityInfo.visibleFraction * 100;
        if (visiblePercentage > 50) {
          setState(() {
            text1InView = true;
          });
        }
      },
      child: Container(
        padding: EdgeInsets.only(left: getSidePadding(context)),
        child: ResponsiveBuilder(
          refinedBreakpoints: const RefinedBreakpoints(),
          builder: (context, sizingInformation) {
            double screenWidth = sizingInformation.screenSize.width;
            if (screenWidth <= 1024) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildTestimonialSectionLg(),
                  const Spacer(),
                  ResponsiveBuilder(
                    builder: (context, sizingInformation) {
                      double screenWidth = sizingInformation.screenSize.width;
                      if (screenWidth <
                          (const RefinedBreakpoints().tabletSmall)) {
                        return _buildImage(
                          width: screenWidth,
                          height: screenHeight * 0.5,
                        );
                      } else {
                        return Center(
                          child: _buildImage(
                            width: screenWidth * 0.75,
                            height: screenHeight * 0.75,
                          ),
                        );
                      }
                    },
                  ),
                ],
              );
            } else {
              return Stack(
                children: [
                  Positioned(
                    right: -screenWidth / 2,
                    child: _buildImage(
                      width: contentAreaWidth,
                      height: contentAreaHeight,
                    ),
                  ),
                  ContentArea(
                    width: contentAreaWidth,
                    height: contentAreaHeight,
                    child: Column(
                      children: [
                        const Spacer(),
                        _buildTestimonialSectionLg(),
                        const Spacer(flex: 2),
                      ],
                    ),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }

  Widget _buildTestimonialSectionLg() {
    return InfoSection1(
      sectionTitle: StringConst.MY_TESTIMONIALS,
      title1: StringConst.TESTIMONIALS_TITLE,
      hasTitle2: false,
      body: StringConst.TEDTIMONIALS_DESC,
      trailing: AnimatedButton(
        title: 'Check out more!',
        iconData: Icons.arrow_forward_ios,
        onTap: () {
          context.go(Routes.linkedin);
        },
      ),
      child: _buildTestimonials(),
    );
  }

  Widget _buildImage({
    required double width,
    required double height,
  }) {
    TextTheme textTheme = Theme.of(context).textTheme;
    TextStyle? titleStyle = textTheme.bodyLarge?.merge(
      Styles.customTextStyle3(
        fontSize: responsiveSize(context, 64, 80, md: 76),
        height: 1.25,
        color: AppColors.primaryColor,
      ),
    );
    double textPosition = assignWidth(context, 0.1);
    return ContentArea(
      width: width,
      height: height,
      child: Stack(
        children: [
          Stack(
            children: [
              Positioned(
                left: 0,
                bottom: 0,
                child: ResponsiveBuilder(
                  refinedBreakpoints: const RefinedBreakpoints(),
                  builder: (context, sizingInformation) {
                    double screenWidth = sizingInformation.screenSize.width;
                    if (screenWidth <
                        (const RefinedBreakpoints().tabletSmall)) {
                      return RotationTransition(
                        turns: _controller,
                        child: Image.asset(
                          ImagePath.kDotsGlobeYeloow,
                          width: Sizes.WIDTH_150,
                          height: Sizes.HEIGHT_150,
                          color: AppColors.primaryColor,
                        ),
                      );
                    } else {
                      return RotationTransition(
                        turns: _controller,
                        child: Image.asset(
                          ImagePath.kDotsGlobeYeloow,
                          width: Sizes.WIDTH_150,
                          height: Sizes.HEIGHT_150,
                          color: AppColors.primaryColor,
                        ),
                      );
                    }
                  },
                ),
              ),
              Image.asset(
                ImagePath.kDevAward,
              ),
              AnimatedPositioned(
                left: text1InView ? textPosition : -150,
                curve: Curves.fastOutSlowIn,
                onEnd: () {
                  setState(() {
                    text2InView = true;
                  });
                },
                duration: const Duration(milliseconds: 750),
                child: Text(StringConst.MY, style: titleStyle),
              ),
              AnimatedPositioned(
                right: text2InView ? textPosition : -150,
                curve: Curves.fastOutSlowIn,
                duration: const Duration(milliseconds: 750),
                child: Text(StringConst.CV, style: titleStyle),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTestimonials() {
    return SizedBox(
      height: responsiveSize(context, 350, 350),
      width: widthOfScreen(context),
      child: CarouselSlider(
        options: CarouselOptions(
          height: responsiveSize(context, 350, 350),
          autoPlay: true,
          viewportFraction: responsiveSize(context, 1, 0.5, md: 1),
        ),
        items: buildCardRow(
          context: context,
          data: Data.testimonials,
          hasAnimation: false,
          isHorizontal: true,
          isWrap: true,
          width: responsiveSize(context, 350, 600, md: 520),
        ),
      ),
    );
  }

  List<Widget> buildCardRow({
    required BuildContext context,
    required List<TestimonialSectionModel> data,
    required double width,
    bool isHorizontal = true,
    bool isWrap = false,
    bool hasAnimation = true,
  }) {
    TextTheme textTheme = Theme.of(context).textTheme;
    List<Widget> items = [];

    for (int index = 0; index < data.length; index++) {
      items.add(
        CustomCard(
          width: width,
          height: responsiveSize(context, 310, 310),
          hasAnimation: hasAnimation,
          title: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: responsiveSize(context, 250, 550, md: 450),
              child: Text(
                data[index].testimonial,
                style: textTheme.titleMedium?.copyWith(
                  fontSize: responsiveSize(
                    context,
                    Sizes.TEXT_SIZE_12,
                    Sizes.TEXT_SIZE_14,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                textAlign: TextAlign.justify,
                maxLines: 10,
              ),
            ),
          ),
          subtitle: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  backgroundImage: NetworkImage(data[index].image),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
                    child: SelectableText(
                      data[index].name,
                      style: textTheme.bodyLarge?.copyWith(
                        fontSize: responsiveSize(
                          context,
                          Sizes.TEXT_SIZE_14,
                          Sizes.TEXT_SIZE_16,
                        ),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: responsiveSize(context, 240, 530, md: 450),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: SelectableText(
                        data[index].position,
                        style: textTheme.bodyLarge?.copyWith(
                          fontSize: responsiveSize(
                            context,
                            Sizes.TEXT_SIZE_14,
                            Sizes.TEXT_SIZE_16,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
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
}
