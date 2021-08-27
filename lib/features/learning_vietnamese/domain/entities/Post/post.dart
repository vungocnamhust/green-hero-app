import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:learning_vietnamese/features/learning_vietnamese/domain/entities/media.dart';

part 'post.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Post extends Equatable {
  @JsonKey(ignore: true)
  final List<Media> mediaList;

  final String content;
  final String title;
  final String location;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int interestedTurns;

  Post({
    this.mediaList,
    this.content,
    this.createdAt,
    this.interestedTurns,
    this.title,
    this.location,
    this.updatedAt,
  });

  @override
  List<Object> get props => [
        this.mediaList,
        this.content,
        this.createdAt,
        this.interestedTurns,
        this.title,
        this.location,
        this.updatedAt,
      ];

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      mediaList: (json["mediaList"] as List)?.map(
          (e) => e == null ? null : Media.fromJson(e as Map<String, dynamic>))?.toList(),
      content: json["content"],
      createdAt: DateTime.tryParse(json["updatedAt"]),
      interestedTurns: 10,
      title: json["title"],
      location: json["location"],
      updatedAt: DateTime.tryParse(json["updatedAt"]),
    );
  }

  Map<String, dynamic> toJson() => _$PostToJson(this);
}
