import '../__lib.dart';

class AppBaseThemeValues {
  static final lightTheme = BaseTheme(
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
    white: Colors.white,
    primary: ColorStyle(
      c100: const Color.fromRGBO(227, 207, 255, 1),
      c400: const Color.fromRGBO(161, 96, 255, 1),
      c600: const Color.fromRGBO(114, 16, 255, 1),
    ),
    secondary: ColorStyle(
      c100: const Color.fromRGBO(242, 207, 224, 1),
      c200: const Color.fromRGBO(233, 175, 203, 1),
      c300: const Color.fromRGBO(222, 134, 176, 1),
      c400: const Color.fromRGBO(211, 94, 150, 1),
    ),
    success: ColorStyle(),
    warning: ColorStyle(),
    danger: ColorStyle(
      c400: const Color.fromRGBO(202, 84, 106, 1),
      c600: const Color.fromRGBO(176, 0, 32, 1),
    ),
    shadowColor: const Color.fromRGBO(217, 217, 217, 0.25),
    neutral: ColorStyle(
      c100: const Color.fromRGBO(207, 207, 207, 1),
      c200: const Color.fromRGBO(175, 175, 175, 1),
      c300: const Color.fromRGBO(134, 134, 134, 1),
      c400: const Color.fromRGBO(94, 94, 94, 1),
      c500: const Color.fromRGBO(54, 54, 54, 1),
      c600: const Color.fromRGBO(14, 14, 14, 1),
    ),
    primaryColor: const Color.fromRGBO(114, 16, 255, 1),
  );

  static final darkTheme = BaseTheme(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Colors.black,
    white: Colors.white,
    primary: ColorStyle(),
    secondary: ColorStyle(),
    success: ColorStyle(),
    warning: ColorStyle(),
    danger: ColorStyle(),
    neutral: ColorStyle(),
    shadowColor: Colors.grey,
    primaryColor: const Color.fromRGBO(114, 16, 255, 1),
  );
}
