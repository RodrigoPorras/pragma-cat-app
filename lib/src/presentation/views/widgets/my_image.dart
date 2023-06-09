import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pragma_cat_app/src/utils/constants/strings.dart';

class MyImage extends StatelessWidget {
  final String referenceImageId;
  const MyImage({super.key, required this.referenceImageId});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      fit: BoxFit.cover,
      imageUrl: "$baseImageUrl/$referenceImageId.jpg",
      progressIndicatorBuilder: (context, url, downloadProgress) => Center(
        child: CircularProgressIndicator(value: downloadProgress.progress),
      ),
      errorWidget: (context, url, error) => Icon(
        Icons.error,
        size: 250,
        color: Colors.grey[400],
      ),
    );
  }
}
