import 'package:learning_vietnamese/features/learning_vietnamese/data/rest_api/datasources/models/api_response.dart';
import 'package:learning_vietnamese/features/learning_vietnamese/domain/entities/user.dart';

abstract class UserRepository {
  Future<ApiResponse<User>> updateUserInfo(User user);
}
