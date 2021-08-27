import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:learning_vietnamese/core/util/url_util.dart';
import 'package:video_player/video_player.dart';

part 'media.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Media extends Equatable {
  final String url;

  /// [MediaType]
  final String type;

  Media({
    String url,
    String type,
  })  : this.url = UrlUtil.process(url, type),
        this.type = UrlUtil.processType(type);

  @override
  List<Object> get props => [
        this.url,
        this.type,
      ];

  factory Media.fromJson(Map<String, dynamic> json) => _$MediaFromJson(json);
  Map<String, dynamic> toJson() => _$MediaToJson(this);
}

class MediaType {
  static const String IMAGE = 'image';
  static const String VIDEO = 'video';
  static const String TEXT = 'text';
  static const String AUDIO = 'audio';
  static const String SQUARE = 'square';
}
