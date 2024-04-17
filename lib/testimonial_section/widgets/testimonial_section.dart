import 'package:abhishek_doshi_portfolio/router/router.dart';
import 'package:abhishek_doshi_portfolio/testimonial_section/testimonial_section.dart';
import 'package:abhishek_doshi_portfolio/values/values.dart';
import 'package:abhishek_doshi_portfolio/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TestimonialSection extends StatelessWidget {
  const TestimonialSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
      child: const TestimonialCarousel(),
    );
  }
}
