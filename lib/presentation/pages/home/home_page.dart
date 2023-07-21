import 'package:abhishek_doshi_portfolio/presentation/layout/adaptive.dart';
import 'package:abhishek_doshi_portfolio/presentation/pages/home/sections/about_me_section.dart';
import 'package:abhishek_doshi_portfolio/presentation/pages/home/sections/awards_section.dart';
import 'package:abhishek_doshi_portfolio/presentation/pages/home/sections/blog_section.dart';
import 'package:abhishek_doshi_portfolio/presentation/pages/home/sections/footer_section.dart';
import 'package:abhishek_doshi_portfolio/presentation/pages/home/sections/header_section/header_section.dart';
import 'package:abhishek_doshi_portfolio/presentation/pages/home/sections/nav_section/nav_section_mobile.dart';
import 'package:abhishek_doshi_portfolio/presentation/pages/home/sections/nav_section/nav_section_web.dart';
import 'package:abhishek_doshi_portfolio/presentation/pages/home/sections/skills_section.dart';
import 'package:abhishek_doshi_portfolio/presentation/pages/home/sections/statistics_section.dart';
import 'package:abhishek_doshi_portfolio/presentation/widgets/app_drawer.dart';
import 'package:abhishek_doshi_portfolio/presentation/widgets/nav_item.dart';
import 'package:abhishek_doshi_portfolio/presentation/widgets/spaces.dart';
import 'package:abhishek_doshi_portfolio/utils/functions.dart';
import 'package:abhishek_doshi_portfolio/values/values.dart';
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
  // bool isFabVisible = false;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  final ScrollController _scrollController = ScrollController();

  final List<NavItemData> navItems = [
    NavItemData(name: StringConst.HOME, key: GlobalKey(), isSelected: true),
    NavItemData(name: StringConst.ABOUT, key: GlobalKey()),
    NavItemData(name: StringConst.SKILLS, key: GlobalKey()),
    NavItemData(name: StringConst.AWARDS, key: GlobalKey()),
    NavItemData(name: StringConst.BLOG, key: GlobalKey()),
  ];

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
              menuList: navItems,
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
            scrollToSection(navItems[0].key.currentContext!);
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
                  navItems: navItems,
                );
              }
            },
          ),
          Expanded(
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
                          HeaderSection(
                            key: navItems[0].key,
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
                              key: navItems[1].key,
                              child: const AboutMeSection(),
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
                            key: navItems[2].key,
                            child: const SkillsSection(),
                          ),
                          SizedBox(height: spacerHeight),
                          const StatisticsSection(),
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
                            key: navItems[3].key,
                            child: const AwardsSection(),
                          ),
                          const SpaceH40(),
                          Container(
                            key: navItems[4].key,
                            child: const BlogSection(),
                          ),
                          const FooterSection(),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
