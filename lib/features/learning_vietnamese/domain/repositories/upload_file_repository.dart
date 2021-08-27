import 'dart:io';

import 'package:learning_vietnamese/features/learning_vietnamese/data/rest_api/datasources/models/api_response.dart';
import 'package:learning_vietnamese/features/learning_vietnamese/domain/entities/file.dart';

abstract class UploadFileRepository {
  Future<ApiResponse<FileLV>> uploadImage(File image);
}
