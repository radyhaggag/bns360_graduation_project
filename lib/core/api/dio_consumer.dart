import 'package:dio/dio.dart';

import '../utils/constants.dart';
import 'api_consumer.dart';

const String _applicationJson = "application/json";
const String _contentType = "Content-Type";

class DioConsumer implements APIConsumer {
  late Dio dio;

  DioConsumer({required this.dio}) {
    Map<String, dynamic> headers = {_contentType: _applicationJson};

    dio.options = BaseOptions(
      baseUrl: baseUrl,
      headers: headers,
      sendTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
    );

    dio.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) {
      if (token != null) {
        options.headers["Authorization"] = token;
      }
      return handler.next(options);
    }));
  }

  @override
  Future<Response> get({
    required String endpoint,
    Map<String, dynamic>? queryParams,
  }) async {
    return await dio.get(endpoint, queryParameters: queryParams);
  }

  @override
  Future<Response> post({
    required String endpoint,
    Map<String, dynamic>? queries,
    Map<String, dynamic>? data,
  }) async {
    return await dio.post(endpoint, queryParameters: queries, data: data);
  }

  @override
  Future<Response> patch({
    required String endpoint,
    Map<String, dynamic>? queries,
    Map<String, dynamic>? data,
  }) async {
    return await dio.patch(endpoint, queryParameters: queries, data: data);
  }
}
