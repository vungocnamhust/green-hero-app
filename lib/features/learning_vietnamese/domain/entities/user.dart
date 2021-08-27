import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class User extends Equatable {
  final String id;
  final String name;
  // thieu truong pasword
  final String email;
  final String phone;
  final DateTime birthday;
  final String avatarUrl;
  final String bio;
  final bool gender;

  User({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.birthday,
    this.avatarUrl,
    this.bio,
    this.gender,
  });

  String get genderString => this.gender == null ? null : (this.gender ? 'Nam' : 'Nữ');
  String get birthdayString => this.birthday == null ? null : DateFormat('dd-MM-yyyy').format(this.birthday.toLocal());

  @override
  List<Object> get props => [
        this.id,
        this.name,
        this.email,
        this.phone,
        this.birthdayString,
        this.avatarUrl,
        this.bio,
        this.gender,
      ];

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);

  User copyWith({
    String id,
    String name,
    String email,
    String phone,
    DateTime birthday,
    String avatarUrl,
    String bio,
    bool gender,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      birthday: birthday ?? this.birthday,
      avatarUrl: avatarUrl ?? this.avatarUrl,
      bio: bio ?? this.bio,
      gender: gender ?? this.gender,
    );
  }
}
