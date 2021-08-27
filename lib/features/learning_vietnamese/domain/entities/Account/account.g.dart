// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Account _$AccountFromJson(Map<String, dynamic> json) {
  return Account(
    name: json['name'] as String,
    lastMsg: json['last_msg'] as String,
    updatedAt: json['updated_at'] as String,
    thumbnail: json['thumbnail'] as String,
  );
}

Map<String, dynamic> _$AccountToJson(Account instance) => <String, dynamic>{
      'name': instance.name,
      'last_msg': instance.lastMsg,
      'updated_at': instance.updatedAt,
      'thumbnail': instance.thumbnail,
    };
