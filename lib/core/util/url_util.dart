import 'package:learning_vietnamese/core/Constant/API_CONST.dart';
import 'package:learning_vietnamese/features/learning_vietnamese/domain/entities/media.dart';

class UrlUtil {
  static String process(String url, String mediaType) {
    if (url == null || url.isEmpty) return url;
    return APIConst.baseUrl +
        APIConst.networkIMediaPrefix +
        "/" +
        processType(mediaType) +
        "/" +
        url;
  }

  static String processType(String mediaType) {
    if (mediaType.contains(MediaType.IMAGE)) return MediaType.IMAGE;
    if (mediaType.contains(MediaType.AUDIO)) return MediaType.AUDIO;
    if (mediaType.contains(MediaType.VIDEO)) return MediaType.VIDEO;
    if (mediaType.contains(MediaType.TEXT)) return MediaType.TEXT;
    return MediaType.IMAGE;
  }

  static String getVideoThumbnailUrl() {
    String thumbnailUrl = "video-thumbnail.jpeg";
    return process(thumbnailUrl, MediaType.IMAGE);
  }
}