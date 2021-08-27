import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:learning_vietnamese/core/Constant/API_CONST.dart';
import 'package:learning_vietnamese/features/learning_vietnamese/data/rest_api/datasources/dio_provider.dart';
import 'package:learning_vietnamese/features/learning_vietnamese/data/shared_preferences/repositories/access_token_storage.dart';

class RestClient {
  final Dio _dio = Dio();
  static const int TIME_OUT = 20000;

  RestClient() {
    _dio.options
      ..baseUrl = APIConst.baseUrl
      ..responseType = ResponseType.json
      ..connectTimeout = TIME_OUT
      ..sendTimeout = TIME_OUT
      ..receiveTimeout = TIME_OUT;

    if (!kReleaseMode) {
      _dio.interceptors.add(LogByMethodInterceptor(
        disabledLogMethods: [],
        disabledLogPaths: [],
      ));
    }
  }

  void _configRequestHeaders() {
    _dio.options.headers = {
      "Accept": "application/json",
      "content-type": Headers.jsonContentType
    };
    final accessToken = AccessTokenStorage().getToken;
    if (accessToken != null)
      _dio.options.headers["Authorization"] = "Bearer $accessToken";
  }

  Future<Response<T>> getMethod<T>(String uri,
      {Map<String, dynamic> params}) async {
    _configRequestHeaders();
    return await _dio.get<T>(uri, queryParameters: params);
  }

  Future<Response<T>> postMethod<T>(String uri, {dynamic data}) async {
    _configRequestHeaders();
    return await _dio.post(uri, data: data);
  }

  Future<Response<T>> putMethod<T>(String uri, {dynamic data}) async {
    _configRequestHeaders();
    return await _dio.put(uri, data: data);
  }

  Future<Response<T>> deleteMethod<T>(String uri,
      {Map<String, dynamic> params}) async {
    _configRequestHeaders();
    return await _dio.delete(uri, queryParameters: params);
  }
}
