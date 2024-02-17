import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';

import 'api/api_error_handler.dart';
import 'api/response_code.dart';
import 'api/response_message.dart';
import 'failure.dart';
import 'firebase/firebase_error_handler.dart';

class ErrorHandler implements Exception {
  late Failure failure;

  ErrorHandler.handle(dynamic error) {
    if (error is DioException) {
      failure = APIErrorHandler.handleAPIError(error);
    } else if (error is FirebaseException) {
      failure = FirebaseErrorHandler.handleFirebaseErrors(error);
    } else {
      failure = const Failure(
        APIResponseCode.unknown,
        APIResponseMessages.unknown,
      );
    }
  }
}
