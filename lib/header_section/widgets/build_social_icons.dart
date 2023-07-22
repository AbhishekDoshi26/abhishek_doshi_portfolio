import 'package:abhishek_doshi_portfolio/values/values.dart';
import 'package:abhishek_doshi_portfolio/widgets/widgets.dart';
import 'package:flutter/material.dart';

class SocialIcons {
  static List<Widget> buildSocialIcons(List<SocialButtonData> socialItems) {
    List<Widget> items = [];
    for (int index = 0; index < socialItems.length; index++) {
      items.add(
        LinkButton(
          url: socialItems[index].url,
          child: Icon(
            socialItems[index].iconData,
            color: AppColors.black,
            size: Sizes.ICON_SIZE_18,
          ),
        ),
      );
      items.add(const SpaceW20());
    }
    return items;
  }
}
