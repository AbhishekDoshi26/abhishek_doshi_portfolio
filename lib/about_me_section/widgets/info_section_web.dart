import 'package:abhishek_doshi_portfolio/about_me_section/about_me_section.dart';
import 'package:abhishek_doshi_portfolio/values/values.dart';
import 'package:abhishek_doshi_portfolio/widgets/widgets.dart';
import 'package:flutter/material.dart';

class InfoSectionWeb extends StatelessWidget {
  const InfoSectionWeb({super.key});
  static const double kSpacingLg = 24.0;
  static const double kRunSpacingLg = 16.0;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InfoSection1(
                sectionTitle: StringConst.ABOUT_ME,
                title1: StringConst.ABOUT_ME_HEADER,
                title2: StringConst.HELP,
                body: StringConst.ABOUT_ME_DESC,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      StringConst.FOLLOW_ME_1,
                      style: textTheme.titleLarge?.copyWith(
                        color: AppColors.black,
                      ),
                    ),
                    const SpaceH16(),
                    const AboutMeSocialButtons(
                      spacing: kSpacingLg,
                      runSpacing: kRunSpacingLg,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
