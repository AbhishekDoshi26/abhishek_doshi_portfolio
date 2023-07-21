import 'package:abhishek_doshi_portfolio/presentation/layout/adaptive.dart';
import 'package:abhishek_doshi_portfolio/presentation/widgets/spaces.dart';
import 'package:abhishek_doshi_portfolio/values/values.dart';
import 'package:flutter/material.dart';

import 'animated_line_through.dart';
import 'buttons/animated_nimbus_button.dart';

class BlogCardData {
  final String category;
  final String date;
  final String title;
  final String buttonText;
  final String imageUrl;

  BlogCardData({
    required this.category,
    required this.title,
    required this.date,
    required this.buttonText,
    required this.imageUrl,
  });
}

class BlogCard extends StatefulWidget {
  const BlogCard({
    super.key,
    required this.category,
    required this.title,
    required this.date,
    required this.buttonText,
    required this.imageUrl,
    this.dateStyle,
    this.titleStyle,
    this.categoryStyle,
    this.buttonTextStyle,
    this.width,
    this.imageWidth,
    this.imageHeight,
    this.buttonColor = AppColors.primaryColor,
    this.buttonIcon = Icons.chevron_right,
    this.dateIcon = Icons.date_range,
    this.onPressed,
  });

  final String category;
  final String date;
  final String title;
  final String buttonText;
  final String imageUrl;
  final double? width;
  final double? imageWidth;
  final double? imageHeight;
  final TextStyle? dateStyle;
  final TextStyle? titleStyle;
  final TextStyle? categoryStyle;
  final TextStyle? buttonTextStyle;
  final IconData dateIcon;
  final IconData buttonIcon;
  final Color buttonColor;
  final VoidCallback? onPressed;

  @override
  State<BlogCard> createState() => _BlogCardState();
}

class _BlogCardState extends State<BlogCard> {
  bool _isHoveringOnImage = false;

  Color startValue = Colors.black.withOpacity(0.5);
  Color targetValue = Colors.black.withOpacity(0);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return SizedBox(
      width: widget.width,
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                margin: const EdgeInsets.only(left: Sizes.MARGIN_16),
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(Sizes.RADIUS_16),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      MouseRegion(
                        onEnter: (e) => _onImageHover(true),
                        onExit: (e) => _onImageHover(false),
                        child: AnimatedOpacity(
                          opacity: _isHoveringOnImage ? 1.0 : 0.85,
                          duration: const Duration(milliseconds: 300),
                          child: ClipRRect(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(Sizes.RADIUS_16),
                            ),
                            child: Image.asset(
                              widget.imageUrl,
                              height: heightOfImage(),
                              width: widthOfImage(),
                              fit: BoxFit.fitHeight,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: Sizes.MARGIN_30),
                padding: const EdgeInsets.symmetric(
                  horizontal: Sizes.PADDING_8,
                  vertical: Sizes.PADDING_8,
                ),
                decoration: const BoxDecoration(
                  color: AppColors.black,
                  borderRadius: BorderRadius.all(
                    Radius.circular(6),
                  ),
                ),
                child: Text(
                  widget.category,
                  style: widget.categoryStyle ??
                      textTheme.titleMedium?.copyWith(
                        fontSize: Sizes.TEXT_SIZE_15,
                        color: AppColors.white,
                      ),
                ),
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(left: Sizes.MARGIN_16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SpaceH8(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      widget.dateIcon,
                      color: AppColors.primaryColor,
                    ),
                    const SpaceW8(),
                    Text(
                      widget.date,
                      style: widget.dateStyle ?? textTheme.titleSmall,
                    )
                  ],
                ),
                const SpaceH8(),
                AnimatedLineThrough(
                  text: widget.title,
                  textStyle: widget.titleStyle ?? textTheme.headlineSmall,
                ),
                const SpaceH16(),
                AnimatedNimbusButton(
                  title: widget.buttonText,
                  iconData: Icons.arrow_forward_ios,
                  leadingButtonColor: widget.buttonColor,
                  onTap: widget.onPressed,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  void _onImageHover(bool hovering) {
    setState(() {
      _isHoveringOnImage = hovering;
    });
  }

  double heightOfImage() {
    return widget.imageHeight ?? assignHeight(context, 0.5);
  }

  double widthOfImage() {
    return widget.imageWidth ?? widthOfScreen(context);
  }
}
