import 'package:dio/dio.dart';

import '../utils/app_endpoints.dart';
import '../utils/constants.dart';
import 'api_consumer.dart';

const String _applicationJson = "application/json";
const String _contentType = "Content-Type";

class DioConsumer implements APIConsumer {
  late Dio dio;

  DioConsumer({required this.dio}) {
    Map<String, dynamic> headers = {_contentType: _applicationJson};

    dio.options = BaseOptions(
      baseUrl: AppEndpoints.baseUrl,
      headers: headers,
      sendTimeout: const Duration(seconds: 60),
      receiveTimeout: const Duration(seconds: 60),
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
    Map<String, dynamic>? headers,
    FormData? formData,
  }) async {
    if (headers != null) {
      for (var header in headers.entries) {
        dio.options.headers[header.key] = header.value;
      }
    }

    return await dio.post(
      endpoint,
      queryParameters: queries,
      data: formData ?? data,
    );
  }

  @override
  Future<Response> patch({
    required String endpoint,
    Map<String, dynamic>? queries,
    Map<String, dynamic>? data,
    FormData? formData,
  }) async {
    return await dio.patch(
      endpoint,
      queryParameters: queries,
      data: formData ?? data,
    );
  }

  @override
  Future<Response> put({
    required String endpoint,
    Map<String, dynamic>? queries,
    Map<String, dynamic>? data,
    FormData? formData,
  }) async {
    return await dio.put(
      endpoint,
      queryParameters: queries,
      data: formData ?? data,
    );
  }

  @override
  Future<Response> delete({
    required String endpoint,
    Map<String, dynamic>? queries,
    Map<String, dynamic>? data,
  }) async {
    return await dio.delete(endpoint, queryParameters: queries, data: data);
  }
}
