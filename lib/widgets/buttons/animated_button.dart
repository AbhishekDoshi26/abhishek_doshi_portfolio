import 'package:abhishek_doshi_portfolio/utils/adaptive.dart';
import 'package:abhishek_doshi_portfolio/values/values.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class AnimatedButton extends StatefulWidget {
  final String title;
  final Color titleColor;
  final double width;
  final double height;
  final double leadingButtonWidth;
  final IconData iconData;
  final double iconSize;
  final Color iconColor;
  final TextStyle? titleStyle;
  final Color leadingButtonColor;
  final Color trailingButtonColor;
  final BorderRadius leadingButtonBorderRadius;
  final BorderRadius leadingButtonHoverBorderRadius;
  final BorderRadius trailingButtonBorderRadius;
  final BorderRadius trailingButtonHoverBorderRadius;
  final Duration duration;
  final Curve curve;
  final GestureTapCallback? onTap;

  const AnimatedButton({
    super.key,
    required this.title,
    required this.iconData,
    this.titleColor = AppColors.white,
    this.titleStyle,
    this.width = 150,
    this.height = 36,
    this.leadingButtonWidth = 36,
    this.iconSize = 16,
    this.iconColor = AppColors.white,
    this.leadingButtonColor = AppColors.primaryColor,
    this.trailingButtonColor = AppColors.blue300,
    this.duration = const Duration(milliseconds: 300),
    this.curve = Curves.easeIn,
    this.leadingButtonBorderRadius = const BorderRadius.all(Radius.circular(4)),
    this.leadingButtonHoverBorderRadius = const BorderRadius.only(
      topLeft: Radius.circular(4),
      bottomLeft: Radius.circular(4),
    ),
    this.trailingButtonHoverBorderRadius =
        const BorderRadius.all(Radius.circular(4)),
    this.trailingButtonBorderRadius = const BorderRadius.only(
      topRight: Radius.circular(4),
      bottomRight: Radius.circular(4),
    ),
    this.onTap,
  });

  @override
  State<AnimatedButton> createState() => _AnimatedButtonState();
}

class _AnimatedButtonState extends State<AnimatedButton> {
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    if (widthOfScreen(context) < const RefinedBreakpoints().desktopSmall) {
      return InkWell(
        onTap: widget.onTap,
        child: Container(
          height: widget.height,
          decoration: BoxDecoration(
            borderRadius: widget.trailingButtonHoverBorderRadius,
            color: widget.trailingButtonColor,
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              widget.iconData,
              color: widget.iconColor,
              size: widget.iconSize,
            ),
          ),
        ),
      );
    } else {
      return InkWell(
        onTap: _isHovering ? widget.onTap : null,
        hoverColor: Colors.transparent,
        child: SizedBox(
          width: widget.width,
          child: Row(
            children: [
              Stack(
                children: [
                  AnimatedContainer(
                    width: _isHovering ? widget.width : 0,
                    height: widget.height,
                    duration: const Duration(milliseconds: 300),
                    curve: widget.curve,
                    decoration: BoxDecoration(
                      borderRadius: _isHovering
                          ? widget.trailingButtonHoverBorderRadius
                          : widget.trailingButtonBorderRadius,
                      color: widget.trailingButtonColor,
                    ),
                  ),
                  MouseRegion(
                    onEnter: _isHovering ? (e) => _onHover(true) : null,
                    onExit: _isHovering ? (e) => _onHover(false) : null,
                    child: SizedBox(
                      width: widget.width,
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: widget.leadingButtonWidth,
                          top: widget.height / 4,
                        ),
                        child: Center(
                          child: Text(
                            widget.title,
                            style: widget.titleStyle ??
                                textTheme.labelLarge?.copyWith(
                                  color: _isHovering
                                      ? widget.titleColor
                                      : Colors.transparent,
                                  fontSize: Sizes.TEXT_SIZE_14,
                                ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  MouseRegion(
                    onEnter: (e) => _onHover(true),
                    onExit: (e) => _onHover(false),
                    child: Container(
                      width: widget.leadingButtonWidth,
                      height: widget.height,
                      decoration: BoxDecoration(
                        borderRadius: _isHovering
                            ? widget.leadingButtonHoverBorderRadius
                            : widget.leadingButtonBorderRadius,
                        color: widget.leadingButtonColor,
                      ),
                      child: Center(
                        child: Icon(
                          widget.iconData,
                          size: widget.iconSize,
                          color: widget.iconColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    }
  }

  void _onHover(bool hovering) {
    setState(() {
      _isHovering = hovering;
    });
  }
}
