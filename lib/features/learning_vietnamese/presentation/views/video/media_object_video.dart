import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:learning_vietnamese/core/util/url_util.dart';
import 'package:learning_vietnamese/features/learning_vietnamese/presentation/common_widgets/data_loader.dart';
import 'package:learning_vietnamese/features/learning_vietnamese/presentation/common_widgets/precache/precache.dart';
import 'package:learning_vietnamese/features/learning_vietnamese/presentation/common_widgets/widget_loading.dart';
import 'package:video_player/video_player.dart';

class MediaObjectVideo extends StatefulWidget {
  final String videoUrl;
  final String videoThumbnailUrl;
  MediaObjectVideo({
    this.videoUrl,
    this.videoThumbnailUrl,
  });

  @override
  _MediaObjectVideoState createState() => _MediaObjectVideoState();
}

class _MediaObjectVideoState extends State<MediaObjectVideo> {
  VideoPlayerController _videoPlayerController;
  ChewieController _chewieController;
  StreamController<bool> streamPlaying = StreamController<bool>.broadcast();

  Future<dynamic> _initializeVideo() async {
    try {
      await PreCache.networkImage(widget.videoThumbnailUrl);
      _videoPlayerController = VideoPlayerController.network(widget.videoUrl);
      _videoPlayerController.addListener(() {
        streamPlaying.sink.add(_videoPlayerController.value.isPlaying);
      });
      await _videoPlayerController.initialize();
      _chewieController = ChewieController(
        videoPlayerController: _videoPlayerController,
        autoPlay: false,
        looping: true,
        showControls: true,
        autoInitialize: true,
        aspectRatio: _videoPlayerController.value.aspectRatio,
        systemOverlaysAfterFullScreen: [SystemUiOverlay.bottom],
        placeholder: WidgetLoading(),
        errorBuilder: (context, errorMessage) => Text(errorMessage),
        overlay: StreamBuilder(
          stream: streamPlaying.stream,
          initialData: false,
          builder: (context, snapshot) {
            if (snapshot.data || (widget.videoThumbnailUrl?.isEmpty ?? true)) return SizedBox.shrink();
            return CachedNetworkImage(
              imageUrl: widget.videoThumbnailUrl,
              fit: BoxFit.cover,
            );
          },
        ),
      );
      return _chewieController;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  @override
  void dispose() {
    streamPlaying.close();
    _videoPlayerController?.dispose();
    _chewieController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return DataLoader(
          loadData: () => _initializeVideo(),
          builder: (data) {
            return SizedBox(
              height: constraints.maxWidth / _videoPlayerController.value.aspectRatio,
              child: Chewie(controller: _chewieController),
            );
          },
        );
      },
    );
  }
}
