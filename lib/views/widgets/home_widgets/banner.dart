
import 'package:visibility_detector/visibility_detector.dart';

import '../../../__lib.dart';

class AdvertBannerWidget extends StatelessWidget {
  const AdvertBannerWidget({
    super.key,
    required this.bannerList,
    required this.onVisibilityChanged,
  });

  final List<NavItem> bannerList;
  final Function(bool) onVisibilityChanged;

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: const Key('banner-key'),
      onVisibilityChanged: (visibilityInfo) {
        var visiblePercentage = visibilityInfo.visibleFraction * 100;
        onVisibilityChanged(visiblePercentage > 50);
      },
      child: SizedBox(
        height: context.scaleH(320),
        child: PageView.builder(
            itemCount: bannerList.length,
            itemBuilder: (context, index) {
              final item = bannerList[index];
              return BannerItemWidget(
                item: item,
                totalItems: bannerList.length,
                curentIndex: index,
              );
            }),
      ),
    );
  }
}

class BannerItemWidget extends StatelessWidget {
  final int curentIndex;
  final int totalItems;
  final NavItem item;

  const BannerItemWidget(
      {super.key,
      required this.curentIndex,
      required this.totalItems,
      required this.item});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AssetsImage(
          item.imagePath,
          width: double.infinity,
          height: context.scaleH(320),
          fit: BoxFit.cover,
        ),
        Positioned(
          bottom: 16,
          left: 16,
          right: 16,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RobotoText(
                    item.title,
                    weight: FontWeight.w700,
                  ),
                  DotIndicator(
                    current: curentIndex,
                    max: totalItems,
                  ),
                ],
              ),
              const HGap(6),
              RobotoText(
                item.content,
                size: 32,
                weight: FontWeight.w700,
              ),
              if (item.subTitle.isNotEmpty)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const HGap(8),
                    RobotoText(item.subTitle),
                  ],
                ),
              const HGap(8),
              MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                color: AppColors.black,
                textColor: Colors.white,
                child: RobotoText(item.cta),
                onPressed: () {},
              )
            ],
          ),
        )
      ],
    );
  }
}
