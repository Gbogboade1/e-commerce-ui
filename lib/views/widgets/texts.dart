import 'package:google_fonts/google_fonts.dart';

import '../../__lib.dart';

extension FigmaDimention on double {
  double toFigmaHeight(double fontSize) {
    return this / fontSize;
  }
}

class RobotoText extends StatelessWidget {
  final String text;
  final FontWeight? weight;
  final double size;
  final double? height;
  final Color? color;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextDecoration? decoration;

  const RobotoText(
    this.text, {
    Key? key,
    this.weight,
    this.size = 14,
    this.height,
    this.color,
    this.textAlign,
    this.maxLines,
    this.decoration,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines,
      textAlign: textAlign,
      overflow: maxLines != null ? TextOverflow.ellipsis : null,
      style: GoogleFonts.roboto(
        fontWeight: weight ?? FontWeight.w400,
        fontSize: context.fontSize(size),
        color: color,
        decoration: decoration,
        height: height?.toFigmaHeight(context.fontSize(size)),
      ),
    );
  }
}
