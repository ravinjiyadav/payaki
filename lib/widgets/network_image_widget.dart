import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:payaki/utilities/color_utility.dart';


class NetworkImageWidget extends StatelessWidget {
  final String? url;
  final Widget? placeholder;
  final BoxFit? fit;
  final double? width;
  final double? height;
  final Widget? errorWidget;
  final Widget? alternate; // if url is empty

  final double? errorIconSize; // if url is empty

  const NetworkImageWidget({Key? key,
    required this.url,
    this.placeholder,
    this.fit,
    this.width,
    this.height,
    this.errorWidget,
    this.alternate,
    this.errorIconSize = 20})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (url != null && url!.isNotEmpty) {
      return CachedNetworkImage(
          imageUrl: url!,
          placeholder: (context, url) {
            return placeholder ?? const Center(
                child: CircularProgressIndicator(
                  color: ColorUtility.color9C5FA3,
                )
            );
          },
          fit: fit ?? BoxFit.cover,
          width: width,
          height: height,
          //  errorWidget:
          errorWidget: (context, url, value) {
            if (
            errorWidget != null) {
              return errorWidget!;
            } else {
              return Container(
                color: ColorUtility.colorEFEFEF,
                child:  Center(
                  child: Icon(
                    Icons.image_not_supported_rounded,
                    color: ColorUtility.color43576F,
                    size: errorIconSize,
                  ),
                ),
              );
            }
          }
        // : null,
      );
    }
    return alternate ??  Container(
      height: height,
      color: ColorUtility.colorEFEFEF,
      child:  Center(
        child: Icon(
          Icons.image_not_supported_rounded,
          color: ColorUtility.color43576F,
          size:  errorIconSize,
        ),
      ),
    );
  }
}

