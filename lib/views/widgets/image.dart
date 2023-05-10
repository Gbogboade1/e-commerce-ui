import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';

import '../../__lib.dart';

Widget boxedImage(
    {required String imgUrl,
    required Color boxColor,
    EdgeInsetsGeometry? padding,
    double imgSize = 24}) {
  return Container(
    padding: padding, //?? pad(horiz: 13, vert: 12),
    decoration: BoxDecoration(
      color: boxColor,
      borderRadius: BorderRadius.circular(3),
    ),
    child: AssetsImage(
      imgUrl,
      height: imgSize,
      width: imgSize,
    ),
  );
}

class AssetsImage extends StatelessWidget {
  final String imgUrl;
  final BoxFit? fit;
  final BoxShape shape;
  final double? height;
  final double? width;
  final double? both;
  final BorderRadiusGeometry? borderRadius;
  final AlignmentGeometry alignment;

  const AssetsImage(this.imgUrl,
      {super.key,
      this.height = 24,
      this.width = 24,
      this.fit,
      this.borderRadius,
      this.alignment = Alignment.center,
      this.shape = BoxShape.rectangle,
      this.both});

  @override
  Widget build(BuildContext context) {
    return Container(
      key: key,
      height: both ?? height,
      width: both ?? width,
      decoration: BoxDecoration(
        shape: shape,
        borderRadius: borderRadius,
        image: DecorationImage(
          image: AssetImage(imgUrl),
          fit: fit,
          alignment: alignment,
        ),
      ),
    );
  }
}

class CacheNetworkImageWidget extends StatelessWidget {
  final String imgUrl;
  final BoxFit? fit;
  final BoxShape shape;
  final double? height;
  final double? width;
  final double? both;
  final ColorFilter? colorFilter;

  const CacheNetworkImageWidget(
      {super.key,
      required this.imgUrl,
      this.fit,
      this.shape = BoxShape.rectangle,
      this.height,
      this.width,
      this.both,
      this.colorFilter});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imgUrl,
      height: both ?? height,
      width: both ?? width,
      imageBuilder:
          (BuildContext context, ImageProvider<Object> imageProvider) {
        return Container(
          decoration: BoxDecoration(
            shape: shape,
            image: DecorationImage(
              image: imageProvider,
              colorFilter: colorFilter,
              fit: fit,
            ),
          ),
        );
      },
      placeholder: (BuildContext context, String url) =>
          const Center(child: CupertinoActivityIndicator()),
      errorWidget: (BuildContext context, String url, dynamic error) {
        log('---cacheNetworkImage----url: $url -----error: $error ------');
        return AssetsImage(
          AppAssets.ASSETS_NAVIGATION_HOME_SEL_PNG,
          shape: shape,
          both: both,
          height: height,
          width: width,
        );
      },
    );
  }
}
