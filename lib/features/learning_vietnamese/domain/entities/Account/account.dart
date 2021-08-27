import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'account.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Account extends Equatable {
  final String name;
  final String lastMsg;
  final String updatedAt;
  final String thumbnail;

  Account({
    this.name,
    this.lastMsg,
    this.updatedAt,
    this.thumbnail,
  });

  @override
  List<Object> get props => [
        this.name,
        this.lastMsg,
        this.updatedAt,
        this.thumbnail,
      ];

  factory Account.fromJson(Map<String, dynamic> json) =>
      _$AccountFromJson(json);
  Map<String, dynamic> toJson() => _$AccountToJson(this);
}
