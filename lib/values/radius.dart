part of 'values.dart';

class AppRadius {
  static const BorderRadius primaryRadius = BorderRadius.only(
    topLeft: Radius.circular(Sizes.RADIUS_30),
    topRight: Radius.circular(Sizes.RADIUS_30),
  );

  static const BorderRadius defaultButtonRadius = BorderRadius.only(
    topLeft: Radius.circular(Sizes.RADIUS_30),
    bottomLeft: Radius.circular(Sizes.RADIUS_30),
  );

  static const BorderRadius northTearDropRadius = BorderRadius.only(
    topLeft: Radius.circular(Sizes.RADIUS_80),
    bottomLeft: Radius.circular(Sizes.RADIUS_80),
    bottomRight: Radius.circular(Sizes.RADIUS_80),
  );
  static const BorderRadius southTearDropRadius = BorderRadius.only(
    topRight: Radius.circular(Sizes.RADIUS_80),
    topLeft: Radius.circular(Sizes.RADIUS_80),
    bottomRight: Radius.circular(Sizes.RADIUS_80),
  );

  static const BorderRadius southSemiCircleRadius = BorderRadius.only(
    bottomRight: Radius.circular(Sizes.RADIUS_80),
    bottomLeft: Radius.circular(Sizes.RADIUS_80),
  );

  static const BorderRadius northSemiCircleRadius = BorderRadius.only(
    topLeft: Radius.circular(Sizes.RADIUS_80),
    topRight: Radius.circular(Sizes.RADIUS_80),
  );

  static const BorderRadius westSemiCircleRadius = BorderRadius.only(
    topLeft: Radius.circular(Sizes.RADIUS_80),
    bottomLeft: Radius.circular(Sizes.RADIUS_80),
  );

  static const BorderRadius eastSemiCircleRadius = BorderRadius.only(
    topRight: Radius.circular(Sizes.RADIUS_80),
    bottomRight: Radius.circular(Sizes.RADIUS_80),
  );

  static const BorderRadius fullCircleRadius = BorderRadius.all(
    Radius.circular(Sizes.RADIUS_80),
  );

  static const BorderRadius noRadius = BorderRadius.all(
    Radius.circular(Sizes.RADIUS_0),
  );

  static const BorderRadius aboutRadius = BorderRadius.all(
    Radius.circular(Sizes.RADIUS_8),
  );
}
