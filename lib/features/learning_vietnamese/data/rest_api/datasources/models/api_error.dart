import 'package:dio/dio.dart';

class ApiError {
  int _code;
  String _message = "";

  int get code => _code;
  String get message => _message;

  ApiError({dynamic error}) {
    if (error != null) _handleError(error);
  }

  factory ApiError.fromJson(Map<String, dynamic> json) {
    return ApiError()
      .._code = json['code'] as int
      .._message = json['message'] as String;
  }

  _handleError(dynamic error) {
    if (error is DioError) {
      _code = error.response?.statusCode ?? 0;
      switch (error.type) {
        case DioErrorType.CONNECT_TIMEOUT:
        case DioErrorType.SEND_TIMEOUT:
        case DioErrorType.RECEIVE_TIMEOUT:
          _message = 'Connection timeout';
          break;
        default:
          _message = error.response?.data['message'] ?? error.message;
          break;
      }
    } else if (error is Error) {
      _message = error.toString();
      print("Exception occured: $error stackTrace: ${error.stackTrace}");
    } else if (error is Exception) {
      _message = error.toString();
      print("Exception occured: $error stackTrace: ${error.toString()}");
    }
    // switch (error.type) {
    //   case DioErrorType.CANCEL:
    //     _message = "Request was cancelled";
    //     break;
    //   case DioErrorType.CONNECT_TIMEOUT:
    //     _message = "Connection timeout";
    //     break;
    //   case DioErrorType.DEFAULT:
    //     _message = "Connection failed due to internet connection";
    //     break;
    //   case DioErrorType.RECEIVE_TIMEOUT:
    //     _message = "Receive timeout in connection";
    //     break;
    //   case DioErrorType.RESPONSE:
    //     _message = "Received invalid status code: ${error.response.statusCode}";
    //     break;
    //   case DioErrorType.SEND_TIMEOUT:
    //     _message = "Receive timeout in send request";
    //     break;
    // }
    // return _message;
  }
}
