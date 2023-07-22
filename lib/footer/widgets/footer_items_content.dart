import 'package:abhishek_doshi_portfolio/footer/footer.dart';
import 'package:abhishek_doshi_portfolio/widgets/widgets.dart';
import 'package:flutter/material.dart';

class FooterItemsContent {
  static List<Widget> buildFooterItems(List<FooterItem> data,
      {bool isHorizontal = false}) {
    List<Widget> items = [];

    for (int index = 0; index < data.length; index++) {
      items.add(
        FooterItem(
          title: data[index].title,
          subtitle: data[index].subtitle,
          iconData: data[index].iconData,
          url: data[index].url,
        ),
      );
      if (index < data.length - 1) {
        if (isHorizontal) {
          items.add(const Spacer(flex: 2));
        } else {
          items.add(const SpaceH40());
        }
      }
    }
    return items;
  }
}
