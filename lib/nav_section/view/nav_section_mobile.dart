import 'package:abhishek_doshi_portfolio/values/values.dart';
import 'package:abhishek_doshi_portfolio/widgets/widgets.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';

class NavSectionMobile extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const NavSectionMobile({super.key, required this.scaffoldKey});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Sizes.HEIGHT_74,
      decoration: const BoxDecoration(
        color: AppColors.black100,
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            right: -100,
            child: Image.asset(
              ImagePath.kBlobFemurAsh,
              color: AppColors.primaryColor,
            ),
          ),
          Row(
            children: [
              const SpaceW30(),
              IconButton(
                icon: const Icon(
                  FeatherIcons.menu,
                  color: AppColors.white,
                  size: Sizes.ICON_SIZE_26,
                ),
                onPressed: () {
                  if (scaffoldKey.currentState!.isEndDrawerOpen) {
                    scaffoldKey.currentState?.openEndDrawer();
                  } else {
                    scaffoldKey.currentState?.openDrawer();
                  }
                },
              ),
              const Spacer(),
              InkWell(
                onTap: () {},
                child: Image.asset(
                  ImagePath.kLogoLight,
                  height: Sizes.HEIGHT_20,
                ),
              ),
              const SpaceW20(),
            ],
          ),
        ],
      ),
    );
  }
}
