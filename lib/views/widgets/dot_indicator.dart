import '../../__lib.dart';

class DotIndicator extends StatelessWidget {
  final int max, current;

  const DotIndicator({super.key, this.max = 3, required this.current});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(
        max,
        (index) => index == current
            ? Container(
                margin: context.insetsSymetric(horizontal: 1.5),
                height: 2,
                width: 12,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2),
                  color: AppColors.black,
                ),
              )
            : Container(
                margin: context.insetsSymetric(horizontal: 1.5),
                height: 2,
                width: 2,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.navGrey,
                ),
              ),
      ),
    );
  }
}
