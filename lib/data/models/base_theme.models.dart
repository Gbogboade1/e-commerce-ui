import '../../__lib.dart';

class BaseTheme {
  final ColorStyle primary;
  final ColorStyle secondary;
  final ColorStyle success;
  final ColorStyle warning;
  final ColorStyle danger;
  final ColorStyle neutral;
  final Color primaryColor;
  final Color white;
  final Color shadowColor;
  final Color scaffoldBackgroundColor;
  final Brightness brightness;

  BaseTheme({
    required this.primary,
    required this.secondary,
    required this.success,
    required this.warning,
    required this.neutral,
    required this.danger,
    required this.primaryColor,
    required this.white,
    required this.shadowColor,
    required this.scaffoldBackgroundColor,
    required this.brightness,
  });
}

class ColorStyle {
  final Color? c100;
  final Color? c200;
  final Color? c300;
  final Color? c400;
  final Color? c500;
  final Color? c600;
  final Color? c700;
  final Color? c800;
  final Color? c900;
  final Color? c1000;

  ColorStyle(
      {this.c100,
      this.c200,
      this.c300,
      this.c400,
      this.c500,
      this.c600,
      this.c700,
      this.c800,
      this.c900,
      this.c1000});
}
