import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:orax_test/core/constants/app_assets.dart';
import 'package:orax_test/core/constants/app_constants.dart';

class AssetView extends StatelessWidget {
  const AssetView({
    super.key,
    required this.imagePath,
    this.height,
    this.isForAsset = false,
    this.width,
    this.color,
    this.scale,
    this.fit,
    this.showVideoThumbNail = true,
  });

  final String imagePath;
  final double? height;
  final double? width;
  final Color? color;
  final double? scale;
  final BoxFit? fit;
  final bool showVideoThumbNail;
  final bool isForAsset;

  @override
  Widget build(BuildContext context) {
    return _getView();
  }

  Widget _getView() {
    final bool isNetwork = imagePath.startsWith('http');
    final String ext = Uri.parse(imagePath).path.split('.').last.toLowerCase();

    if (isNetwork) {
      if (AppConstants.imageFormats.contains('.$ext')) {
        return CachedNetworkImage(
          imageUrl: imagePath,
          height: height,
          width: width,
          fit: fit ?? BoxFit.cover,
          placeholder: (context, string) => _placeholder(),
          errorWidget: (context, string, obj) => _placeholder(),
        );
      }
    }

    switch (ext) {
      case "svg":
        return SvgPicture.asset(
          imagePath,
          height: height,
          width: width,
          fit: fit ?? BoxFit.fill,
          colorFilter: color != null
              ? ColorFilter.mode(color!, BlendMode.srcIn)
              : null,
        );

      case "png":
      case "jpg":
      case "jpeg":
        return isForAsset
            ? Image.asset(
                imagePath,
                height: height,
                width: width,
                fit: fit ?? BoxFit.cover,
              )
            : Image.file(
                File(imagePath),
                height: height,
                width: width,
                fit: fit ?? BoxFit.cover,
              );

      default:
        return _placeholder();
    }
  }

  Widget _placeholder() {
    return Image.asset(
      AppAssets.placeholder,
      height: height,
      width: width,
      fit: fit ?? BoxFit.cover,
      scale: scale,
    );
  }
}
