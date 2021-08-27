import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PreCache {
  static Future<void> networkImage(String url) async {
    if (url == null || url.isEmpty) return;
    await precacheImage(
      CachedNetworkImageProvider(url),
      Get.context,
      onError: (exception, stackTrace) => print(stackTrace),
    );
  }
}
