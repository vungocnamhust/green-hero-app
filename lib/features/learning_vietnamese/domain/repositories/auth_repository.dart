import 'package:learning_vietnamese/features/learning_vietnamese/data/rest_api/datasources/models/api_response.dart';
import 'package:learning_vietnamese/features/learning_vietnamese/domain/entities/auth.dart';
import 'package:learning_vietnamese/features/learning_vietnamese/domain/entities/user.dart';

abstract class AuthRepository {
  Future<ApiResponse<User>> signUp({
    String email,
    String password,
    String name,
  });

  Future<ApiResponse<User>> changePassword(
    User user,
    String curentPassword,
    String newPassword,
  );

  Future<void> signInWithGoogle();
  Future<ApiResponse<Auth>> signInWithEmailPassword(
    String email,
    String password,
  );

  Future<void> signOut();

  bool isSignedIn();
  Future<ApiResponse<User>> getUser(String accessToken); // verifyAccessToken
}
