import 'package:abhishek_doshi_portfolio/footer/footer.dart';
import 'package:flutter/material.dart';

class FooterItemContent extends StatelessWidget {
  const FooterItemContent({
    required this.data,
    this.isHorizontal = false,
    super.key,
  });

  final List<FooterItem> data;
  final bool isHorizontal;

  @override
  Widget build(BuildContext context) {
    if (isHorizontal) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: data
            .map(
              (data) => FooterItem(
                title: data.title,
                subtitle: data.subtitle,
                iconData: data.iconData,
                url: data.url,
              ),
            )
            .toList(),
      );
    } else {
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: data
            .map(
              (data) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: FooterItem(
                  title: data.title,
                  subtitle: data.subtitle,
                  iconData: data.iconData,
                  url: data.url,
                ),
              ),
            )
            .toList(),
      );
    }
  }
}
