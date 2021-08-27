import 'package:learning_vietnamese/features/learning_vietnamese/data/rest_api/datasources/models/api_response.dart';
import 'package:learning_vietnamese/features/learning_vietnamese/data/rest_api/datasources/models/api_result.dart';
import 'package:learning_vietnamese/features/learning_vietnamese/data/rest_api/datasources/rest_client.dart';
import 'package:learning_vietnamese/features/learning_vietnamese/domain/entities/user.dart';
import 'package:learning_vietnamese/features/learning_vietnamese/domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final RestClient _client = RestClient();

  @override
  Future<ApiResponse<User>> updateUserInfo(User user) async {
    try {
      var response = await _client.putMethod('/users/' + user.id, data: {
        '_id': user.id,
        'name': user.name,
        'email': user.email,
        'avatarUrl': user.avatarUrl,
        'phone': user.phone,
        'gender': user.gender,
        'bio': user.bio,
        'birthday': user.birthday?.toIso8601String(),
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
}
