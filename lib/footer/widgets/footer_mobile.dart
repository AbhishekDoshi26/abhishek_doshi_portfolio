import 'package:abhishek_doshi_portfolio/footer/footer.dart';
import 'package:abhishek_doshi_portfolio/values/values.dart';
import 'package:abhishek_doshi_portfolio/widgets/widgets.dart';
import 'package:flutter/material.dart';

class FooterMobile extends StatelessWidget {
  const FooterMobile({
    super.key,
    required this.height,
    required this.width,
  });

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return ContentArea(
      width: width,
      backgroundColor: AppColors.black400,
      borderRadius: const BorderRadius.all(
        Radius.circular(Sizes.RADIUS_8),
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(
          Radius.circular(Sizes.RADIUS_8),
        ),
        child: Stack(
          children: [
            Positioned(
              top: -(height * 0.1),
              left: -(height * 0.15),
              child: Image.asset(
                ImagePath.kBoxCoverGold,
                height: height * 0.5,
                color: AppColors.primaryColor,
              ),
            ),
            Positioned(
              bottom: -(height * 0.1),
              right: -(height * 0.1),
              child: Image.asset(
                ImagePath.kBoxCoverBlack,
                height: height * 0.6,
                fit: BoxFit.cover,
              ),
            ),
            Center(
              child: Column(
                children: [
                  const SpaceH80(),
                  Text(
                    StringConst.LETS_TALK,
                    textAlign: TextAlign.center,
                    style: textTheme.headlineMedium
                        ?.copyWith(color: AppColors.white),
                  ),
                  const SpaceH60(),
                  FooterItemContent(
                    data: Data.footerItems,
                  ),
                  const SpaceH60(),
                  const PortfolioLinkButton(
                    url: StringConst.EMAIL_URL,
                    buttonTitle: StringConst.HIRE_ME,
                    buttonColor: AppColors.primaryColor,
                  ),
                  const SpaceH80(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
