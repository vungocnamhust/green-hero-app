import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'auth.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Auth extends Equatable {
  final String accessToken;

  Auth({
    this.accessToken,
  });

  @override
  List<Object> get props => [
        this.accessToken,
      ];

  factory Auth.fromJson(Map<String, dynamic> json) => _$AuthFromJson(json);
  Map<String, dynamic> toJson() => _$AuthToJson(this);
}
