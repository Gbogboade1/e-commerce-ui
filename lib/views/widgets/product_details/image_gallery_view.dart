import '../../../__lib.dart';

class ImageGalleyView extends StatefulWidget {
  const ImageGalleyView({super.key, required this.imagesList});
  final List<String> imagesList;

  @override
  State<ImageGalleyView> createState() => _ImageGalleyViewState();
}

class _ImageGalleyViewState extends State<ImageGalleyView> {
  late ValueNotifier<int> _index;

  @override
  void initState() {
    super.initState();

    _index = ValueNotifier(0);
  }

  @override
  void dispose() {
    _index.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: AppColors.imageBgGrey,
      ),
      height: context.scaleH(400),
      child: Stack(
        children: [
          ValueListenableBuilder(
            valueListenable: _index,
            builder: (context, value, child) {
              return AssetsImage(
                widget.imagesList[value],
                both: double.infinity,
              );
            },
          ),
          Positioned(
            top: 24,
            left: 10,
            child: Column(
              children: List.generate(
                widget.imagesList.length,
                (index) => InkWell(
                  onTap: () {
                    _index.value = index;
                  },
                  child: Padding(
                    padding: context.insetsAll(4),
                    child: AssetsImage(
                      widget.imagesList[index],
                      borderRadius: BorderRadius.circular(3),
                      fit: BoxFit.cover,
                      both: 50,
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
