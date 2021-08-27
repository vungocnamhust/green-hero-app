import 'package:learning_vietnamese/core/Constant/API_CONST.dart';
import 'package:learning_vietnamese/features/learning_vietnamese/data/rest_api/datasources/models/api_response.dart';
import 'package:learning_vietnamese/features/learning_vietnamese/data/rest_api/datasources/models/api_result.dart';
import 'package:learning_vietnamese/features/learning_vietnamese/data/rest_api/datasources/rest_client.dart';
import 'package:learning_vietnamese/features/learning_vietnamese/domain/entities/Post/post.dart';
import 'package:learning_vietnamese/features/learning_vietnamese/domain/repositories/post_repository.dart';

/// REST
class PostRepositoryImpl implements PostRepository {
  final RestClient _client = RestClient();

  @override
  Future<ApiResponse<List<Post>>> getPosts() async {
    try {
      var response = await _client
          .getMethod('/users/' + APIConst.userId.toString() + '/articles');

      return ApiResponse.withResult(
        response: response.data,
        resultConverter: (json) => ApiResultList<Post>(
          json: json,
          rootName: 'articles',
          jsonConverter: (json) => Post.fromJson(json),
        ),
      );
    } catch (error) {
      return ApiResponse.withError(error);
    }
  }

  @override
  Future<ApiResponse<Post>> getPostById(int id) async {
    try {
      var response = await _client.getMethod('/posts/$id');
      return ApiResponse.withResult(
        response: response.data,
        resultConverter: (json) => ApiResultSingle<Post>(
          json: json,
          rootName: 'unit',
          jsonConverter: (json) => Post.fromJson(json),
        ),
      );
    } catch (error) {
      return ApiResponse.withError(error);
    }
  }
}
