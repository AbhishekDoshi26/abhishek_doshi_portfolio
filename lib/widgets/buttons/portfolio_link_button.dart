import 'package:abhishek_doshi_portfolio/utils/functions.dart';
import 'package:abhishek_doshi_portfolio/values/values.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/link.dart';

import 'portfolio_button.dart';

class PortfolioLinkButton extends StatelessWidget {
  const PortfolioLinkButton({
    super.key,
    required this.buttonTitle,
    required this.url,
    this.linkTarget = LinkTarget.blank,
    this.buttonColor = AppColors.black400,
    this.builder,
    this.width = Sizes.WIDTH_150,
    this.height = Sizes.HEIGHT_60,
  });

  final String url;
  final String buttonTitle;
  final LinkTarget linkTarget;

  final Color buttonColor;
  final double? width;
  final double? height;
  final LinkWidgetBuilder? builder;

  @override
  Widget build(BuildContext context) {
    return Link(
      uri: Uri.parse(url),
      target: linkTarget,
      builder: (context, followLink) {
        return PortfolioButton(
          width: width,
          height: height,
          buttonTitle: buttonTitle,
          buttonColor: buttonColor,
          onPressed: () {
            openUrlLink(url);
          },
        );
      },
    );
  }
}
