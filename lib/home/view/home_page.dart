import 'package:abhishek_doshi_portfolio/about_me_section/about_me_section.dart';
import 'package:abhishek_doshi_portfolio/blog_section/blog_section.dart';
import 'package:abhishek_doshi_portfolio/footer/footer.dart';
import 'package:abhishek_doshi_portfolio/header_section/header_section.dart';
import 'package:abhishek_doshi_portfolio/home/home.dart';
import 'package:abhishek_doshi_portfolio/nav_section/nav_section.dart';
import 'package:abhishek_doshi_portfolio/skills_section/skills_section.dart';
import 'package:abhishek_doshi_portfolio/statistics_section/statistics_section.dart';
import 'package:abhishek_doshi_portfolio/testimonial_section/testimonial_section.dart';
import 'package:abhishek_doshi_portfolio/utils/utils.dart';
import 'package:abhishek_doshi_portfolio/values/values.dart';
import 'package:abhishek_doshi_portfolio/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:visibility_detector/visibility_detector.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: 300),
    vsync: this,
  );
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.easeInOut,
  );

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _controller.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _scrollController.addListener(() {
      if (_scrollController.position.pixels < 100) {
        _controller.reverse();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = heightOfScreen(context);
    double spacerHeight = screenHeight * 0.10;

    return Scaffold(
      key: _scaffoldKey,
      drawer: ResponsiveBuilder(
        refinedBreakpoints: const RefinedBreakpoints(),
        builder: (context, sizingInformation) {
          double screenWidth = sizingInformation.screenSize.width;
          if (screenWidth < const RefinedBreakpoints().desktopSmall) {
            return AppDrawer(
              menuList: Data.navItems,
            );
          } else {
            return Container();
          }
        },
      ),
      floatingActionButton: ScaleTransition(
        scale: _animation,
        child: FloatingActionButton(
          onPressed: () {
            // Scroll to header section
            scrollToSection(Data.navItems[0].key.currentContext!);
          },
          child: const Icon(
            FontAwesomeIcons.arrowUp,
            size: Sizes.ICON_SIZE_18,
            color: AppColors.white,
          ),
        ),
      ),
      body: Column(
        children: [
          ResponsiveBuilder(
            refinedBreakpoints: const RefinedBreakpoints(),
            builder: (context, sizingInformation) {
              double screenWidth = sizingInformation.screenSize.width;
              if (screenWidth < const RefinedBreakpoints().desktopSmall) {
                return NavSectionMobile(scaffoldKey: _scaffoldKey);
              } else {
                return NavSectionWeb(
                  navItems: Data.navItems,
                );
              }
            },
          ),
          _HomeBody(
            scrollController: _scrollController,
            spacerHeight: spacerHeight,
            controller: _controller,
          ),
        ],
      ),
    );
  }
}

class _HomeBody extends StatelessWidget {
  const _HomeBody({
    required ScrollController scrollController,
    required this.spacerHeight,
    required AnimationController controller,
  })  : _scrollController = scrollController,
        _controller = controller;

  final ScrollController _scrollController;
  final double spacerHeight;
  final AnimationController _controller;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ScrollConfiguration(
        behavior: SmoothScrollBehavior(),
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            children: [
              Stack(
                children: [
                  Positioned.fill(
                    child: Align(
                      alignment: Alignment.center,
                      child: Image.asset(ImagePath.kBlobBeanAsh),
                    ),
                  ),
                  Column(
                    children: [
                      HeaderSectionView(
                        key: Data.navItems[0].key,
                      ),
                      SizedBox(height: spacerHeight),
                      VisibilityDetector(
                        key: const Key("about"),
                        onVisibilityChanged: (visibilityInfo) {
                          double visiblePercentage =
                              visibilityInfo.visibleFraction * 100;
                          if (visiblePercentage > 10) {
                            _controller.forward();
                          }
                        },
                        child: Container(
                          key: Data.navItems[1].key,
                          child: const AboutMeSectionView(),
                        ),
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(height: spacerHeight),
              Stack(
                children: [
                  Positioned(
                    top: assignWidth(context, 0.1),
                    left: -assignWidth(context, 0.05),
                    child: Image.asset(ImagePath.kBlobFemurAsh),
                  ),
                  Positioned(
                    right: -assignWidth(context, 0.5),
                    child: Image.asset(ImagePath.kBlobSmallBeanAsh),
                  ),
                  Column(
                    children: [
                      Container(
                        key: Data.navItems[2].key,
                        child: const SkillsSectionView(),
                      ),
                      SizedBox(height: spacerHeight),
                      const StatisticsSectionView(),
                    ],
                  ),
                ],
              ),
              SizedBox(height: spacerHeight),
              Stack(
                children: [
                  Positioned(
                    left: -assignWidth(context, 0.6),
                    child: Image.asset(ImagePath.kBlobAsh),
                  ),
                  Column(
                    children: [
                      Container(
                        key: Data.navItems[3].key,
                        child: const TestimonialSectionView(),
                      ),
                      const SpaceH40(),
                      Container(
                        key: Data.navItems[4].key,
                        child: const BlogSectionView(),
                      ),
                      const FooterSectionView(),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
