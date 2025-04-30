

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../data/network/api_service.dart';

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

final dioProvider = Provider<Dio>(
      (ref) {
    Dio dio = Dio(ref.read(baseOptions));
    dio.interceptors.add(
      ref.read(prettyDioLoggerProvider),
    );
    return dio;
  },
);

final apiServiceProvider = Provider<ApiService>(
      (ref) => ApiService(ref.read(dioProvider), baseUrl: ""),
);