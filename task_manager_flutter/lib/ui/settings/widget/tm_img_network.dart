import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:task_manager_flutter/gen/assets.gen.dart';

class TMImageNetwork extends StatelessWidget {
  const TMImageNetwork({
    super.key,
    this.demesion = 50.0,
    required this.imageUrl,
  });
  final double demesion;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(demesion),
      child: SizedBox.square(
          dimension: demesion,
          child: !imageUrl.contains('http')
              ? Image.asset(Assets.images.imgAvatarDefault.path)
              : CachedNetworkImage(
                  imageUrl: imageUrl,
                  placeholder: (context, url) => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  errorWidget: (context, url, error) => CircleAvatar(
                    radius: 50.0,
                    backgroundImage: AssetImage(
                      Assets.images.imgAvatarDefault.path,
                    ),
                  ),
                )),
    );
  }
}
