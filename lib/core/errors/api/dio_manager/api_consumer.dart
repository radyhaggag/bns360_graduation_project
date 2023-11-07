import 'package:dio/dio.dart';

abstract class APIConsumer {
  Future<Response<dynamic>> get({
    required String url,
    Map<String, dynamic>? queries,
  });

  Future<Response<dynamic>> post({
    required String url,
    Map<String, dynamic>? queries,
    Map<String, dynamic>? data,
  });

  Future<Response<dynamic>> patch({
    required String url,
    Map<String, dynamic>? queries,
    Map<String, dynamic>? data,
  });
}
