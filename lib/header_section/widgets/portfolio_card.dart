import 'package:abhishek_doshi_portfolio/values/values.dart';
import 'package:abhishek_doshi_portfolio/widgets/widgets.dart';
import 'package:flutter/material.dart';

class CustomCard extends StatefulWidget {
  const CustomCard({
    super.key,
    this.leading,
    this.title,
    this.subtitle,
    this.trailing,
    this.columnMainAxisAlignment = MainAxisAlignment.start,
    this.columnCrossAxisAlignment = CrossAxisAlignment.start,
    this.rowMainAxisAlignment = MainAxisAlignment.start,
    this.rowCrossAxisAlignment = CrossAxisAlignment.center,
    this.width,
    this.height,
    this.offsetY = -40,
    this.elevation = Sizes.ELEVATION_4,
    this.hasAnimation = true,
    this.borderRadius = const BorderRadius.all(Radius.circular(12)),
    this.padding = const EdgeInsets.symmetric(
      horizontal: Sizes.PADDING_0,
      vertical: Sizes.PADDING_12,
    ),
  });

  final Widget? leading;
  final Widget? title;
  final Widget? subtitle;
  final Widget? trailing;
  final double? width;
  final double? height;
  final double? elevation;
  final double offsetY;
  final MainAxisAlignment columnMainAxisAlignment;
  final CrossAxisAlignment columnCrossAxisAlignment;
  final CrossAxisAlignment rowCrossAxisAlignment;
  final MainAxisAlignment rowMainAxisAlignment;
  final EdgeInsetsGeometry padding;
  final BorderRadius borderRadius;
  final bool hasAnimation;

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard>
    with SingleTickerProviderStateMixin {
  bool _hovering = false;
  late AnimationController _controller;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));
    animation = Tween(begin: 0.0, end: widget.offsetY).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOutQuart),
    );
  }

  Future<void> _animateCard() async {
    if (_hovering) {
      try {
        await _controller.forward().orCancel;
      } on TickerCanceled {
        _controller.stop();
      }
    } else {
      try {
        await _controller.reverse().orCancel;
      } on TickerCanceled {
        _controller.stop();
      }
    }
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.hasAnimation
        ? MouseRegion(
            onEnter: (e) => _mouseEnter(true),
            onExit: (e) => _mouseEnter(false),
            child: AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return Transform.translate(
                  offset: Offset(0, animation.value),
                  child: _buildCard(),
                );
              },
            ),
          )
        : _buildCard();
  }

  Widget _buildCard() {
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: ClipRRect(
        borderRadius: widget.borderRadius,
        child: Card(
          elevation: widget.elevation,
          child: Padding(
            padding: widget.padding,
            child: Row(
              mainAxisAlignment: widget.rowMainAxisAlignment,
              crossAxisAlignment: widget.rowCrossAxisAlignment,
              children: [
                if (widget.leading != null) const Spacer(),
                if (widget.leading != null) widget.leading!,
                if (widget.leading != null) const Spacer(),
                Column(
                  mainAxisAlignment: widget.columnMainAxisAlignment,
                  crossAxisAlignment: widget.columnCrossAxisAlignment,
                  children: [
                    const Spacer(),
                    widget.title ?? const Empty(),
                    widget.title != null ? const SpaceH8() : const Empty(),
                    widget.subtitle ?? const Empty(),
                    const Spacer(),
                  ],
                ),
                if (widget.trailing != null) const Spacer(),
                if (widget.trailing != null) widget.trailing!,
                if (widget.trailing != null) const Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _mouseEnter(bool hovering) {
    setState(() {
      _hovering = hovering;
    });
    _animateCard();
  }
}
