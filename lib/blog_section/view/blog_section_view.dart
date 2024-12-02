import 'package:abhishek_doshi_portfolio/blog_section/blog_section.dart';
import 'package:abhishek_doshi_portfolio/router/router.dart';
import 'package:abhishek_doshi_portfolio/utils/utils.dart';
import 'package:abhishek_doshi_portfolio/values/values.dart';
import 'package:abhishek_doshi_portfolio/widgets/widgets.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_builder/responsive_builder.dart';

class BlogSectionView extends StatefulWidget {
  const BlogSectionView({super.key});
  @override
  State<BlogSectionView> createState() => _BlogSectionViewState();
}

class _BlogSectionViewState extends State<BlogSectionView> {
  final int blogLength = Data.blogData.length;
  int currentPageIndex = 1;
  final CarouselSliderController _carouselController =
      CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    EdgeInsetsGeometry padding =
        EdgeInsets.symmetric(horizontal: getSidePadding(context));
    double headerIntroTextSize = responsiveSize(
      context,
      Sizes.TEXT_SIZE_36,
      Sizes.TEXT_SIZE_56,
      md: Sizes.TEXT_SIZE_36,
    );
    double screenWidth = widthOfScreen(context) - (getSidePadding(context) * 2);
    double contentAreaWidth =
        responsiveSize(context, screenWidth, screenWidth * 0.6);

    return Stack(
      children: [
        Positioned(
          top: 60,
          right: 0,
          child: SelectableText(
            StringConst.BLOGGING,
            style: textTheme.displayLarge?.copyWith(
              color: AppColors.grey50,
              fontSize: headerIntroTextSize * 2,
            ),
          ),
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ResponsiveBuilder(builder: (context, sizingInformation) {
              double screenWidth = sizingInformation.screenSize.width;
              if (screenWidth <= (const RefinedBreakpoints().tabletNormal)) {
                return ContentArea(
                  padding: padding,
                  child: Column(
                    children: [
                      ContentArea(
                        width: contentAreaWidth,
                        child: const InfoSection2(
                          sectionTitle: StringConst.MY_BLOG,
                          title1: StringConst.BLOG_SECTION_TITLE_1,
                          title2: StringConst.BLOG_SECTION_TITLE_2,
                          body: StringConst.BLOG_DESC,
                        ),
                      ),
                      const SpaceH50(),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: PortfolioButton(
                          buttonTitle: StringConst.BLOG_VIEW_ALL,
                          buttonColor: AppColors.primaryColor,
                          onPressed: () {
                            context.go(Routes.medium);
                          },
                        ),
                      ),
                    ],
                  ),
                );
              } else {
                return ContentArea(
                  padding: padding,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ContentArea(
                        width: screenWidth * 0.7,
                        child: const InfoSection1(
                          sectionTitle: StringConst.MY_BLOG,
                          title1: StringConst.BLOG_SECTION_TITLE_1,
                          title2: StringConst.BLOG_SECTION_TITLE_2,
                          body: StringConst.BLOG_DESC,
                        ),
                      ),
                      const Spacer(),
                      PortfolioButton(
                        buttonTitle: StringConst.BLOG_VIEW_ALL,
                        buttonColor: AppColors.primaryColor,
                        onPressed: () {
                          context.go(Routes.medium);
                        },
                      ),
                    ],
                  ),
                );
              }
            }),
            const SpaceH40(),
            Padding(
              padding: padding,
              child: ResponsiveBuilder(
                builder: (context, sizingInformation) {
                  double widthOfScreen = sizingInformation.screenSize.width;
                  if (widthOfScreen <
                      (const RefinedBreakpoints().tabletLarge)) {
                    return SizedBox(
                      width: widthOfScreen,
                      height: screenWidth + 250,
                      child: CarouselSlider.builder(
                        itemCount: blogLength,
                        carouselController: _carouselController,
                        disableGesture: false,
                        itemBuilder: (
                          BuildContext context,
                          int index,
                          int pageViewIndex,
                        ) {
                          final blog = Data.blogData[index];
                          return BlogCard(
                            width: screenWidth,
                            imageWidth: screenWidth,
                            imageHeight: screenWidth,
                            category: blog.category,
                            title: blog.title,
                            date: blog.date,
                            buttonText: blog.buttonText,
                            imageUrl: blog.imageUrl,
                            onPressed: () {
                              openUrlLink(blog.url);
                            },
                          );
                        },
                        options: carouselOptions(),
                      ),
                    );
                  } else if (widthOfScreen >=
                          const RefinedBreakpoints().tabletLarge &&
                      widthOfScreen <= 1024) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          width: screenWidth,
                          child: CarouselSlider.builder(
                            itemCount: blogLength,
                            carouselController: _carouselController,
                            disableGesture: false,
                            itemBuilder: (BuildContext context, int index,
                                int pageViewIndex) {
                              return BlogCard(
                                width: screenWidth * 0.45,
                                imageWidth: screenWidth * 0.45,
                                imageHeight: screenWidth * 0.45,
                                category: Data.blogData[index].category,
                                title: Data.blogData[index].title,
                                date: Data.blogData[index].date,
                                buttonText: Data.blogData[index].buttonText,
                                imageUrl: Data.blogData[index].imageUrl,
                                onPressed: () {
                                  openUrlLink(Data.blogData[index].url);
                                },
                              );
                            },
                            options: carouselOptions(
                              viewportFraction: 0.50,
                              autoPlay: false,
                              initialPage: currentPageIndex.toInt(),
                              aspectRatio: 2 / 1.4,
                              enableInfiniteScroll: true,
                              enlargeCenterPage: false,
                            ),
                          ),
                        ),
                      ],
                    );
                  } else {
                    return Align(
                      alignment: Alignment.centerLeft,
                      child: Column(
                        children: [
                          BlogCards(width: screenWidth),
                          const SpaceH100(),
                        ],
                      ),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ],
    );
  }

  CarouselOptions carouselOptions({
    bool autoPlay = true,
    bool enlargeCenterPage = false,
    bool enableInfiniteScroll = true,
    double viewportFraction = 1.0,
    double aspectRatio = 0.1,
    int initialPage = 1,
  }) {
    return CarouselOptions(
        autoPlay: autoPlay,
        enableInfiniteScroll: enableInfiniteScroll,
        enlargeCenterPage: enlargeCenterPage,
        viewportFraction: viewportFraction,
        aspectRatio: aspectRatio,
        initialPage: initialPage,
        onPageChanged: (int index, CarouselPageChangedReason reason) {
          setState(() {
            currentPageIndex = index;
          });
        });
  }
}
