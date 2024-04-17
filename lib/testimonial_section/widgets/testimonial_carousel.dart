import 'package:abhishek_doshi_portfolio/testimonial_section/testimonial_section.dart';
import 'package:abhishek_doshi_portfolio/utils/utils.dart';
import 'package:abhishek_doshi_portfolio/values/values.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class TestimonialCarousel extends StatelessWidget {
  const TestimonialCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: responsiveSize(context, 400, 400),
      width: widthOfScreen(context),
      child: CarouselSlider.builder(
        options: CarouselOptions(
          height: responsiveSize(context, 400, 400),
          enlargeCenterPage: true,
          autoPlay: true,
          viewportFraction: responsiveSize(context, 1, 0.5, md: 0.9),
        ),
        itemCount: Data.testimonials.length,
        itemBuilder: (context, index, realIndex) {
          return TestimonialCard(testimonial: Data.testimonials[index]);
        },
      ),
    );
  }
}
