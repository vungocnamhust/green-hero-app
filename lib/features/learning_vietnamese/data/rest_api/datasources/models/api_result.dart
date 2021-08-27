import 'package:flutter/foundation.dart';

import 'metadata.dart';

abstract class ApiResult<T> {
  T data;
  ApiResult();
}

/// Dữ liệu API trả về dạng List
class ApiResultList<T> extends ApiResult<List<T>> {
  Metadata metadata;

  ApiResultList({
    @required Map<String, dynamic> json,
    @required String rootName,
    @required T Function(dynamic json) jsonConverter,
  }) {
    if (json.containsKey('metadata')) {
      this.metadata = Metadata.fromJson(json['metadata']);
    }
    if (!json.containsKey(rootName)) return;
    var dataJson = json[rootName];
    if (dataJson is List) {
      this.data = dataJson.map(jsonConverter).toList();
    }
  }
}

/// Dữ liệu API trả về là 1 phần tử
class ApiResultSingle<T> extends ApiResult<T> {
  ApiResultSingle({
    @required Map<String, dynamic> json,
    @required String rootName,
    @required T Function(dynamic json) jsonConverter,
  }) {
    if (!json.containsKey(rootName)) return;
    var dataJson = json[rootName];
    this.data = jsonConverter(dataJson);
  }
}
