// dio_client.dart

import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioClient {
  static Dio createDio() {
    const username = '117465'; // change this
    const password = 'may@2025'; // change this

    final basicAuth =
        'Basic ${base64Encode(utf8.encode('$username:$password'))}';

    final dio = Dio(BaseOptions(
      baseUrl: 'http://pslieqpai.lulugroupindia.local:8079', // base URL
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      headers: {
        'Content-Type': 'application/soap+xml',
        'Authorization': basicAuth,
      },
    ));

    dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseHeader: false,
        responseBody: true,
        compact: true,
      ),
    );

    return dio;
  }
}

