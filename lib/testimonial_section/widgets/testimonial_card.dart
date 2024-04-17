import 'package:abhishek_doshi_portfolio/testimonial_section/testimonial_section.dart';
import 'package:abhishek_doshi_portfolio/utils/utils.dart';
import 'package:abhishek_doshi_portfolio/values/values.dart';
import 'package:flutter/material.dart';

class TestimonialCard extends StatelessWidget {
  const TestimonialCard({
    super.key,
    required this.testimonial,
  });

  final TestimonialSectionModel testimonial;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Card(
      elevation: 4,
      child: Stack(
        children: [
          Container(
            color: AppColors.primaryColor,
            height: 120,
            width: 600,
          ),
          Positioned(
            top: 60,
            child: Column(
              children: [
                Container(
                  height: 120,
                  width: 120,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 5),
                    image: DecorationImage(
                      image: NetworkImage(testimonial.image),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                SelectableText(
                  testimonial.name,
                  style: textTheme.titleLarge?.copyWith(
                    fontSize: responsiveSize(
                      context,
                      Sizes.TEXT_SIZE_14,
                      Sizes.TEXT_SIZE_16,
                    ),
                    color: Colors.black,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                SelectableText(
                  testimonial.position,
                  style: textTheme.bodyLarge?.copyWith(
                    fontSize: responsiveSize(
                      context,
                      Sizes.TEXT_SIZE_14,
                      Sizes.TEXT_SIZE_16,
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
                  child: SizedBox(
                    width: responsiveSize(context, 250, 550, md: 450),
                    child: Text(
                      testimonial.testimonial,
                      style: textTheme.titleMedium?.copyWith(
                        fontSize: responsiveSize(
                          context,
                          Sizes.TEXT_SIZE_12,
                          Sizes.TEXT_SIZE_14,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      textAlign: TextAlign.justify,
                      maxLines: 7,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
