import 'dart:convert';
import 'dart:io';

import 'package:learning_vietnamese/core/Constant/API_CONST.dart';
import 'package:learning_vietnamese/features/learning_vietnamese/data/rest_api/datasources/models/api_response.dart';
import 'package:learning_vietnamese/features/learning_vietnamese/data/rest_api/datasources/models/api_result.dart';
import 'package:learning_vietnamese/features/learning_vietnamese/domain/entities/file.dart';
import 'package:learning_vietnamese/features/learning_vietnamese/domain/repositories/upload_file_repository.dart';

import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

class UploadFileRepositoryImpl implements UploadFileRepository {
  @override
  Future<ApiResponse<FileLV>> uploadImage(File image) async {
    try {
      var postUri = Uri.parse(APIConst.baseUrl);

      print(image.path);

      var request = new http.MultipartRequest("POST", postUri);
      request.files.add(
        new http.MultipartFile(
          'file',
          File(image.path).readAsBytes().asStream(),
          File(image.path).lengthSync(),
          filename: image.path,
          contentType: new MediaType('image', image.runtimeType.toString()),
        ),
      );

      var response = await request.send();

      // listen for response
      if (response.statusCode == 200)
        response.stream.transform(utf8.decoder).listen((value) {
          return ApiResponse.withResult(
            response: jsonDecode(value),
            resultConverter: (json) => ApiResultSingle<FileLV>(
              json: json,
              rootName: 'file',
              jsonConverter: (json) => FileLV.fromJson(json),
            ),
          );
        });

      return null;
    } catch (error) {
      return ApiResponse.withError(error);
    }
  }
}
