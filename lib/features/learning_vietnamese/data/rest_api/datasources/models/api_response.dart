import 'package:learning_vietnamese/features/learning_vietnamese/data/rest_api/datasources/models/api_error.dart';

import 'api_result.dart';

/// Model để hứng response từ API trả về
/// - Nếu trả về dữ liệu thì [result] != null và [error] = null
/// - Nếu trả về lỗi thì [result] = null và [error] != null
class ApiResponse<T> {
  String status;
  ApiResult<T> result;
  ApiError error;

  bool get hasData => result?.data != null;
  bool get hasError => error != null;
  bool get isSuccessed => status == ApiResponseStatus.success;
  bool get isFailed => status == ApiResponseStatus.error;

  ApiResponse();

  factory ApiResponse.withResult({
    Map<String, dynamic> response,
    ApiResult Function(dynamic json) resultConverter,
  }) {
    String status = response['status'] as String;
    if (status == "success") {
      return ApiResponse()
        ..status = status
        ..result = resultConverter != null
            ? resultConverter(response['result'])
            : null;
    } else {
      return ApiResponse()
        ..status = status
        ..error = ApiError.fromJson(response);
    }
  }

  factory ApiResponse.withError(dynamic error) {
    return ApiResponse()
      ..status = ApiResponseStatus.error
      ..error = ApiError(error: error);
  }
}

class ApiResponseStatus {
  static const success = "success";
  static const error = "error";
}
