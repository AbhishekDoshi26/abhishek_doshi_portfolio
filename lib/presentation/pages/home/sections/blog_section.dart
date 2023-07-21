import 'package:abhishek_doshi_portfolio/presentation/layout/adaptive.dart';
import 'package:abhishek_doshi_portfolio/presentation/widgets/blog_card.dart';
import 'package:abhishek_doshi_portfolio/presentation/widgets/buttons/nimbus_button.dart';
import 'package:abhishek_doshi_portfolio/presentation/widgets/content_area.dart';
import 'package:abhishek_doshi_portfolio/presentation/widgets/nimbus_info_section.dart';
import 'package:abhishek_doshi_portfolio/presentation/widgets/spaces.dart';
import 'package:abhishek_doshi_portfolio/values/values.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

const double kSpacing = 28.0;
const double kRunSpacing = 16.0;

class BlogSection extends StatefulWidget {
  const BlogSection({super.key});
  @override
  State<BlogSection> createState() => _BlogSectionState();
}

class _BlogSectionState extends State<BlogSection> {
  final int blogLength = Data.blogData.length;
  int currentPageIndex = 1;
  final CarouselController _carouselController = CarouselController();

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
              if (screenWidth <= (const RefinedBreakpoints().tabletSmall)) {
                return ContentArea(
                  padding: padding,
                  child: Column(
                    children: [
                      ContentArea(
                        width: contentAreaWidth,
                        child: const NimbusInfoSection2(
                          sectionTitle: StringConst.MY_BLOG,
                          title1: StringConst.BLOG_SECTION_TITLE_1,
                          title2: StringConst.BLOG_SECTION_TITLE_2,
                          body: StringConst.BLOG_DESC,
                        ),
                      ),
                      const SpaceH50(),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: NimbusButton(
                          buttonTitle: StringConst.BLOG_VIEW_ALL,
                          buttonColor: AppColors.primaryColor,
                          onPressed: () {},
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
                        child: const NimbusInfoSection1(
                          sectionTitle: StringConst.MY_BLOG,
                          title1: StringConst.BLOG_SECTION_TITLE_1,
                          title2: StringConst.BLOG_SECTION_TITLE_2,
                          body: StringConst.BLOG_DESC,
                        ),
                      ),
                      const Spacer(),
                      NimbusButton(
                        buttonTitle: StringConst.BLOG_VIEW_ALL,
                        buttonColor: AppColors.primaryColor,
                        onPressed: () {},
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
                        itemBuilder: (BuildContext context, int index,
                            int pageViewIndex) {
                          return BlogCard(
                            width: screenWidth,
                            imageWidth: screenWidth,
                            imageHeight: screenWidth,
                            category: Data.blogData[index].category,
                            title: Data.blogData[index].title,
                            date: Data.blogData[index].date,
                            buttonText: Data.blogData[index].buttonText,
                            imageUrl: Data.blogData[index].imageUrl,
                            onPressed: () {},
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
                                onPressed: () {},
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
                        _buildDotsIndicator(
                          pageLength: blogLength,
                          currentIndex: currentPageIndex,
                        ),
                        const SpaceH100(),
                      ],
                    );
                  } else {
                    return Align(
                      alignment: Alignment.centerLeft,
                      child: Column(
                        children: [
                          Wrap(
                            spacing: kSpacing,
                            runSpacing: kRunSpacing,
                            children: _buildBlogCards(
                              blogData: Data.blogData,
                              width: screenWidth,
                            ),
                          ),
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
    ScrollPhysics? scrollPhysics = const NeverScrollableScrollPhysics(),
  }) {
    return CarouselOptions(
        autoPlay: autoPlay,
        enableInfiniteScroll: enableInfiniteScroll,
        enlargeCenterPage: enlargeCenterPage,
        viewportFraction: viewportFraction,
        aspectRatio: aspectRatio,
        initialPage: initialPage,
        scrollPhysics: scrollPhysics,
        onPageChanged: (int index, CarouselPageChangedReason reason) {
          setState(() {
            currentPageIndex = index;
          });
        });
  }

  List<Widget> _buildBlogCards({
    required List<BlogCardData> blogData,
    required double width,
  }) {
    double cardWidth = ((width - (kSpacing * 2)) / 3);
    List<Widget> items = [];

    for (int index = 0; index < blogData.length; index++) {
      items.add(
        BlogCard(
          width: cardWidth,
          imageWidth: cardWidth,
          imageHeight: cardWidth,
          category: blogData[index].category,
          title: blogData[index].title,
          date: blogData[index].date,
          buttonText: blogData[index].buttonText,
          imageUrl: blogData[index].imageUrl,
          onPressed: () {},
        ),
      );
    }
    return items;
  }

  Widget _buildDotsIndicator({
    required int pageLength,
    required int currentIndex,
  }) {
    return DotsIndicator(
      dotsCount: pageLength,
      position: currentIndex.toDouble(),
      onTap: (index) {
        _moveToNextCarousel(index.toInt());
      },
      decorator: const DotsDecorator(
        color: AppColors.yellow10,
        activeColor: AppColors.yellow400,
        size: Size(Sizes.SIZE_6, Sizes.SIZE_6),
        activeSize: Size(Sizes.SIZE_24, Sizes.SIZE_6),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(Sizes.RADIUS_8),
          ),
        ),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(Sizes.RADIUS_8),
          ),
        ),
        spacing: EdgeInsets.symmetric(horizontal: Sizes.SIZE_4),
      ),
    );
  }

  _moveToNextCarousel(int index) {
    setState(() {
      currentPageIndex = index;
      _carouselController.animateToPage(index);
    });
  }
}
