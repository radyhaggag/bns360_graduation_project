import 'package:dio/dio.dart';

abstract class APIConsumer {
  Future<Response<dynamic>> get({
    required String endpoint,
    Map<String, dynamic>? queryParams,
  });

  Future<Response<dynamic>> post({
    required String endpoint,
    Map<String, dynamic>? queries,
    Map<String, dynamic>? data,
  });

  Future<Response<dynamic>> patch({
    required String endpoint,
    Map<String, dynamic>? queries,
    Map<String, dynamic>? data,
  });
}
