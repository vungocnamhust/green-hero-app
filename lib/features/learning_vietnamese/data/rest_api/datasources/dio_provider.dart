import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';

class DioProvider {
  static Dio instance() {
    final dio = Dio();

//    dio.interceptors.add(AuthInterceptor());
    dio.interceptors.add(HttpLogInterceptor());

    return dio;
  }
}

class HttpLogInterceptor extends InterceptorsWrapper {
  @override
  Future onRequest(RequestOptions options) async {
    log("onRequest: ${options.uri}\n"
        "data = ${options.data}\n"
        "method = ${options.method}\n"
        "headers = ${options.headers}\n"
        "queryParameters = ${options.queryParameters}");
    return options;
  }

  @override
  Future onResponse(Response response) {
    log("onResponse: $response");
    return super.onResponse(response);
  }

  @override
  Future onError(DioError err) {
    log("onError: $err\n"
        "Response: ${err.response}");
    return super.onError(err);
  }
}

class LogByMethodInterceptor extends LogInterceptor {
  LogByMethodInterceptor({this.disabledLogMethods = const ['GET'], this.disabledLogPaths = const []}) {
    this.requestHeader = true;
    this.requestBody = false;
    this.responseHeader = false;
    this.responseBody = true;
    this.logPrint = _logPrint;
  }

  List<String> disabledLogMethods;
  List<String> disabledLogPaths;

  void _logPrint(Object object) {
    try {
      var json = JsonDecoder().convert(object);
      JsonEncoder encoder = JsonEncoder.withIndent('    ');
      String prettyLog = encoder.convert(json);
      log(prettyLog);
    } catch (e) {
      print(object);
    }
  }

  @override
  Future<dynamic> onResponse(Response response) async {
    if (disabledLogMethods.contains(response.request.method.toUpperCase())) {
      return null;
    }

    for (var path in disabledLogPaths) {
      if (response.request.path.startsWith(path)) {
        return null;
      }
    }

    return super.onResponse(response);
  }
}