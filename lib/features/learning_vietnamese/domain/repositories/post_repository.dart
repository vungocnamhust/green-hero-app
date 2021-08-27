import 'package:learning_vietnamese/features/learning_vietnamese/data/rest_api/datasources/models/api_response.dart';
import 'package:learning_vietnamese/features/learning_vietnamese/domain/entities/Post/post.dart';

abstract class PostRepository {
  Future<ApiResponse<List<Post>>> getPosts();
  Future<ApiResponse<Post>> getPostById(int id);
}
