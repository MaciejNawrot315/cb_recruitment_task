import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class MyCashedNetworkImage extends StatelessWidget {
  final String url;
  const MyCashedNetworkImage({
    Key? key,
    required this.url,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url,
      placeholder: (context, url) => SizedBox(
        height: 300,
        child: Center(
            child: Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Container(
            color: Colors.white,
          ),
        )),
      ),
      errorWidget: (context, url, error) => SizedBox(
        height: 300,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.error),
            Text("we couldn't load this picture")
          ],
        ),
      ),
    );
  }
}
