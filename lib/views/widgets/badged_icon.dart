import '../../__lib.dart';

class BadgedIcon extends StatelessWidget {
  final String iconPath;
  final String value;
  final double size;

  const BadgedIcon(
      {super.key, this.size = 32, required this.iconPath, required this.value});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: context.insetsOnly(right: 4, top: 2),
          child: AssetsImage(
            iconPath,
            both: context.scaleW(size),
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          top: 0,
          right: 0,
          child: Container(
            padding: context.insetsSymetric(horizontal: 4, vertical: 2),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(3),
              color: AppColors.red,
            ),
            child: RobotoText(
              value,
              color: Colors.white,
              size: 12,
            ),
          ),
        )
      ],
    );
  }
}
