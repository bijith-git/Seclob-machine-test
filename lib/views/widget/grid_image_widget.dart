import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:machine_test/models/profile_model.dart';

class GridImageWIdget extends StatelessWidget {
  const GridImageWIdget({
    super.key,
    required this.post,
    required this.textTheme,
  });

  final Media post;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
              fit: BoxFit.cover,
              image: CachedNetworkImageProvider(post.filePath))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Align(
              alignment: Alignment.bottomLeft,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.favorite_outline,
                    color: Colors.white,
                  ),
                  Text(
                    post.likeCount.toString(),
                    style: textTheme.bodyLarge!.copyWith(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  )
                ],
              )),
          Align(
              alignment: Alignment.bottomLeft,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.comment_outlined,
                    color: Colors.white,
                  ),
                  Text(
                    post.commentCount.toString(),
                    style: textTheme.bodyLarge!.copyWith(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  )
                ],
              )),
        ],
      ),
    );
  }
}
