import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'file.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class FileLV extends Equatable {
  final String filename;

  FileLV({
    this.filename,
  });

  @override
  List<Object> get props => [
        this.filename,
      ];

  factory FileLV.fromJson(Map<String, dynamic> json) => _$FileLVFromJson(json);
  Map<String, dynamic> toJson() => _$FileLVToJson(this);
}
