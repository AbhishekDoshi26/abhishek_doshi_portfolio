import 'package:abhishek_doshi_portfolio/utils/utils.dart';
import 'package:abhishek_doshi_portfolio/values/values.dart';
import 'package:abhishek_doshi_portfolio/widgets/widgets.dart';
import 'package:flutter/material.dart';

class FooterItem extends StatelessWidget {
  const FooterItem({
    super.key,
    required this.iconData,
    required this.title,
    required this.subtitle,
    required this.url,
  });

  final String title;
  final String subtitle;
  final IconData iconData;
  final String url;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          iconData,
          color: AppColors.primaryColor,
          size: Sizes.ICON_SIZE_36,
        ),
        const SpaceH8(),
        Text(
          title,
          style: textTheme.titleMedium?.copyWith(
            color: AppColors.white,
          ),
        ),
        const SpaceH8(),
        InkWell(
          onTap: () => openUrlLink(url),
          child: Text(
            subtitle,
            style: textTheme.bodyLarge?.copyWith(
              color: AppColors.grey250,
            ),
          ),
        ),
      ],
    );
  }
}
