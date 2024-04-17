import 'package:abhishek_doshi_portfolio/utils/functions.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/link.dart';

class LinkButton extends StatelessWidget {
  const LinkButton({
    super.key,
    required this.url,
    required this.child,
    this.linkTarget = LinkTarget.blank,
    this.builder,
  });

  final String url;
  final Widget child;
  final LinkTarget linkTarget;
  final LinkWidgetBuilder? builder;

  @override
  Widget build(BuildContext context) {
    return Link(
      uri: Uri.parse(url),
      target: linkTarget,
      builder: (context, followLink) {
        return InkWell(
          onTap: () => openUrlLink(url),
          child: child,
        );
      },
    );
  }
}
