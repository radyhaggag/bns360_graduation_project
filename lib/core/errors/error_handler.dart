import 'package:dio/dio.dart';

import 'api/api_error_handler.dart';
import 'api/response_code.dart';
import 'api/response_message.dart';
import 'failure.dart';

class ErrorHandler implements Exception {
  late Failure failure;

  ErrorHandler.handle(dynamic error) {
    if (error is DioException) {
      failure = APIErrorHandler.handleAPIError(error);
    } else {
      failure = const Failure(
        APIResponseCode.unknown,
        APIResponseMessages.unknown,
      );
    }
  }
}
