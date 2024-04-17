import 'package:flutter/material.dart';

class SmoothScrollBehavior extends ScrollBehavior {
  @override
  ScrollPhysics getScrollPhysics(BuildContext context) {
    return const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics())
        .applyTo(const ScrollPhysics())
        .applyTo(const ScrollPhysics())
        .applyTo(const BouncingScrollPhysics())
        .applyTo(const AlwaysScrollableScrollPhysics());
  }
}
