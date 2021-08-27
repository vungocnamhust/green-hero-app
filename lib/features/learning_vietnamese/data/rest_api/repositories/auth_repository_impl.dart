import 'package:flutter/foundation.dart';
import 'package:learning_vietnamese/features/learning_vietnamese/data/rest_api/datasources/models/api_response.dart';
import 'package:learning_vietnamese/features/learning_vietnamese/data/rest_api/datasources/models/api_result.dart';
import 'package:learning_vietnamese/features/learning_vietnamese/data/rest_api/datasources/rest_client.dart';
import 'package:learning_vietnamese/features/learning_vietnamese/data/shared_preferences/repositories/access_token_storage.dart';
import 'package:learning_vietnamese/features/learning_vietnamese/domain/entities/auth.dart';
import 'package:learning_vietnamese/features/learning_vietnamese/domain/entities/user.dart';
import 'package:learning_vietnamese/features/learning_vietnamese/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final RestClient _client = RestClient();

  @override
  Future<ApiResponse<User>> signUp({
    @required String email,
    @required String password,
    @required String name,
    String avatarUrl,
    String phone,
    bool gender,
    String bio,
    int age,
  }) async {
    try {
      var response = await _client.postMethod('/auths/register', data: {
        'email': email,
        'password': password,
        'name': name,
        'avatarUrl': avatarUrl,
        'phone': phone,
        'gender': gender,
        'bio': bio,
        'age': age,
        'role': 3,  // Role Student = 3
      });
      return ApiResponse.withResult(
        response: response.data,
        resultConverter: (json) => ApiResultSingle<User>(
          json: json,
          rootName: 'user',
          jsonConverter: (json) => User.fromJson(json),
        ),
      );
    } catch (error) {
      return ApiResponse.withError(error);
    }
  }

  @override
  Future<ApiResponse<Auth>> signInWithEmailPassword(
    String email,
    String password,
  ) async {
    try {
      print('signInWithEmailPassword');
      var response = await _client.postMethod('/auths/login', data: {
        'email': email,
        'password': password,
      });
      return ApiResponse.withResult(
        response: response.data,
        resultConverter: (json) => ApiResultSingle<Auth>(
          json: json,
          rootName: 'auth',
          jsonConverter: (json) => Auth.fromJson(json),
        ),
      );
    } catch (error) {
      return ApiResponse.withError(error);
    }
  }

  @override
  Future<void> signInWithGoogle() {
    // TODO: implement signInWithGoogle
    throw UnimplementedError();
  }

  @override
  Future<ApiResponse<User>> changePassword(
    User user,
    String currentPassword,
    String newPassword,
  ) async {
    try {
      var response = await _client.postMethod('/auths/changePassword', data: {
        'user': user.toJson(),
        'currentPassword': currentPassword,
        'newPassword': newPassword,
      });
      return ApiResponse.withResult(
        response: response.data,
        resultConverter: (json) => ApiResultSingle<User>(
          json: json,
          rootName: 'user',
          jsonConverter: (json) => User.fromJson(json),
        ),
      );
    } catch (error) {
      return ApiResponse.withError(error);
    }
  }

  @override
  Future<ApiResponse<User>> getUser(String accessToken) async {
    try {
      var response = await _client
          .postMethod('/auths/verify', data: {'accessToken': accessToken});
      return ApiResponse.withResult(
        response: response.data,
        resultConverter: (json) => ApiResultSingle<User>(
          json: json,
          rootName: 'user',
          jsonConverter: (json) => User.fromJson(json),
        ),
      );
    } catch (error) {
      return ApiResponse.withError(error);
    }
  }

  @override
  bool isSignedIn() {
    final res = AccessTokenStorage().getToken;
    return res != null ? true : false;
  }

  @override
  Future<void> signOut() async {
    await AccessTokenStorage().deleteToken();
  }
}
