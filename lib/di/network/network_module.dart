

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../data/network/api_service.dart';
import '../../data/network/dio_client.dart';

final baseOptions =
Provider<BaseOptions>((ref) => BaseOptions(baseUrl: ""));

final prettyDioLoggerProvider = Provider<PrettyDioLogger>(
      (ref) => PrettyDioLogger(
    request: true,
    requestBody: true,
    requestHeader: true,
    responseBody: true,
    responseHeader: true,
    logPrint: (log) {
      return debugPrint(log as String);
    },
  ),
);

// final dioProvider = Provider<Dio>(
//       (ref) {
//     Dio dio = Dio(ref.read(baseOptions));
//     dio.interceptors.add(
//       ref.read(prettyDioLoggerProvider),
//     );
//     return dio;
//   },
// );

final dioProvider = Provider.family<Dio, (String username, String password)>((ref, credentials) {
  final (username, password) = credentials;
  final dio = createDioClient(username, password);
  dio.interceptors.add(ref.read(prettyDioLoggerProvider));
  return dio;
});


final apiServiceProvider = Provider.family<ArticleEnquiryApiService, (String username, String password)>(
      (ref, credentials) {
    final dio = ref.read(dioProvider(credentials));
    return ArticleEnquiryApiService(dio);
  },
);