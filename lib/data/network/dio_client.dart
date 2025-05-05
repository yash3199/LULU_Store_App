// dio_client.dart

import 'dart:convert';

import 'package:dio/dio.dart';

Dio createDioClient(String username, String password) {
  final dio = Dio();

  dio.options.headers["Authorization"] = "Basic ${base64Encode(utf8.encode('$username:$password'))}";
  dio.options.headers["Content-Type"] = "application/soap+xml";
  dio.options.responseType = ResponseType.plain; // Important to keep XML as raw text

  return dio;
}


