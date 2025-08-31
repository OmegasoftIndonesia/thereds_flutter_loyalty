import 'package:dio/dio.dart';
import 'dart:io';
import 'package:dio/dio.dart' as dio;
import 'package:flutter/foundation.dart';

class uploadMediawithRetry {
  int? status_code;
  String? message;
  uploadMediawithRetry({this.status_code, this.message});

  factory uploadMediawithRetry.fromJson(Map<String, dynamic> object) {
    return uploadMediawithRetry(
        status_code: object['status_code'], message: object['message']);
  }

  static Future<uploadMediawithRetry> upload(
      File imageFile, String filename) async {
    try {
      var dioRequest = dio.Dio();
      FormData formData = FormData.fromMap({
        "token": "asUhgsjjk667hsjhgajdd00",
        "fileName": filename,
        "file": await MultipartFile.fromFile(imageFile.absolute.path,
            filename: filename),
      });
      dioRequest.options.contentType = "multipart/form-data";
      Response response = await dioRequest.post(
          "http://api-dev.omegasoft.co.id/v1/omegagram/uploadFTPMenu",
          data: formData);

      debugPrint("URL: http://api-dev.omegasoft.co.id/v1/omegagram/uploadFTPMenu");
      debugPrint("Body: {Token: asUhgsjjk667hsjhgajdd00, fileName: $filename, file: ${imageFile.absolute.path}}");
      debugPrint("Response: ${response.data}");
      return uploadMediawithRetry.fromJson(response.data);
    } catch (error, stacktrace) {
      throw Exception("Exception occured: $error stackTrace: $stacktrace");
    }
  }
}
