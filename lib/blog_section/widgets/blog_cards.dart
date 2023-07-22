import 'package:abhishek_doshi_portfolio/blog_section/blog_section.dart';
import 'package:abhishek_doshi_portfolio/utils/functions.dart';
import 'package:abhishek_doshi_portfolio/values/values.dart';
import 'package:flutter/material.dart';

class BlogCards extends StatelessWidget {
  const BlogCards({super.key, required this.width});

  final double width;

  static const double kSpacing = 28.0;
  static const double kRunSpacing = 16.0;

  @override
  Widget build(BuildContext context) {
    double cardWidth = ((width - (kSpacing * 2)) / 3);

    return Wrap(
      spacing: kSpacing,
      runSpacing: kRunSpacing,
      children: Data.blogData
          .map(
            (e) => BlogCard(
              width: cardWidth,
              imageWidth: cardWidth,
              imageHeight: cardWidth,
              category: e.category,
              title: e.title,
              date: e.date,
              buttonText: e.buttonText,
              imageUrl: e.imageUrl,
              onPressed: () {
                openUrlLink(e.url);
              },
            ),
          )
          .toList(),
    );
  }
}
