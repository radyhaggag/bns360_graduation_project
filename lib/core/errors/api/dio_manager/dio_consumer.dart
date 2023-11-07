import 'package:dio/dio.dart';

import '../../../utils/constants.dart';
import 'api_consumer.dart';

const String _applicationJson = "application/json";
const String _contentType = "Content-Type";

class DioConsumer implements APIConsumer {
  late Dio _dio;

  DioConsumer({required Dio dio}) : _dio = dio {
    _dio = Dio();

    Map<String, dynamic> headers = {_contentType: _applicationJson};

    _dio.options = BaseOptions(
      baseUrl: baseUrl,
      headers: headers,
      sendTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
    );

    _dio.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) {
      if (token != null) {
        options.headers["Authorization"] = token;
      }
      return handler.next(options);
    }));
  }

  @override
  Future<Response> get({
    required String url,
    Map<String, dynamic>? queries,
  }) async {
    return await _dio.get(url, queryParameters: queries);
  }

  @override
  Future<Response> post({
    required String url,
    Map<String, dynamic>? queries,
    Map<String, dynamic>? data,
  }) async {
    return await _dio.post(url, queryParameters: queries, data: data);
  }

  @override
  Future<Response> patch({
    required String url,
    Map<String, dynamic>? queries,
    Map<String, dynamic>? data,
  }) async {
    return await _dio.patch(url, queryParameters: queries, data: data);
  }
}
