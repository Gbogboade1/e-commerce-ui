import '../../__lib.dart';

class WGap extends StatelessWidget {
  const WGap(
    this._x, {
    super.key,
  });

  final double _x;

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: context.scaleW(_x));
  }
}

class HGap extends StatelessWidget {
  const HGap(
    this._y, {
    super.key,
  });
  final double _y;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.scaleH(_y),
    );
  }
}

double screenHeight(BuildContext context, {double percent = 1}) =>
    MediaQuery.of(context).size.height * percent;

double screenWidth(BuildContext context, {double percent = 1}) =>
    MediaQuery.of(context).size.width * percent;
