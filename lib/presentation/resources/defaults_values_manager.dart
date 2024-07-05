import 'package:flutter/material.dart';

class AppDefaults {
  static const double radius = 15;
  static const double margin = 15;
  static const double padding = 15;

  /// Used For Border Radius
  static BorderRadius borderRadius = BorderRadius.circular(radius);

  /// Used For Bottom Sheet
  static BorderRadius bottomSheetRadius = const BorderRadius.only(
    topLeft: Radius.circular(radius),
    topRight: Radius.circular(radius),
  );

  /// Used For Top Sheet
  static BorderRadius topSheetRadius = const BorderRadius.only(
    bottomLeft: Radius.circular(radius),
    bottomRight: Radius.circular(radius),
  );

  /// Default Box Shadow used for containers
  static List<BoxShadow> boxShadow = [
    BoxShadow(
      blurRadius: 10,
      spreadRadius: 0,
      offset: const Offset(0, 2),
      color: Colors.black.withOpacity(0.04),
    ),
  ];

  static Duration duration = const Duration(milliseconds: 300);
}

class AppMargin{
  static const double m8 = 8.0;
  static const double m12 = 12.0;
  static const double m14 = 14.0;
  static const double m16 = 16.0;
  static const double m18 = 18.0;
  static const double m20 = 20.0;
}
class AppPadding{
  static const double p8 = 8.0;
  static const double p12 = 12.0;
  static const double p14 = 14.0;
  static const double p16 = 16.0;
  static const double p18 = 18.0;
  static const double p20 = 20.0;
}

class AppSize{
  static const double s0 = 0;
  static const double s1 = 1;
  static const int s2 = 2;
  static const double s1_5 = 1.5;
  static const double s4 = 4.0;
  static const double s8 = 8.0;
  static const double s12 = 12.0;
  static const double s14 = 14.0;
  static const double s16 = 16.0;
  static const double s18 = 18.0;
  static const double s20 = 20.0;
  static const double s28 = 28.0;
  static const double s40 = 40.0;
  static const double s60 = 60.0;
  static const double s90 = 90.0;
  static const double s100 = 100.0;
  static const double s120 = 120.0;
  static const double s140 = 140.0;
  static const double s160 = 160.0;
  static const double s190 = 190.0;
}