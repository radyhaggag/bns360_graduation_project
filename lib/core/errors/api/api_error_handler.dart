import 'package:dio/dio.dart';

import '../failure.dart';
import 'response_code.dart';
import 'response_message.dart';

abstract class APIErrorHandler {
  static Failure handleAPIError(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return const Failure(
          APIResponseCode.connectTimeout,
          APIResponseMessages.connectTimeout,
        );
      case DioExceptionType.sendTimeout:
        return const Failure(
          APIResponseCode.sendTimeout,
          APIResponseMessages.sendTimeout,
        );
      case DioExceptionType.receiveTimeout:
        return const Failure(
          APIResponseCode.receiveTimeout,
          APIResponseMessages.receiveTimeout,
        );
      case DioExceptionType.badResponse:
        switch (dioException.response?.statusCode) {
          case APIResponseCode.success:
            return const Failure(
              APIResponseCode.success,
              APIResponseMessages.success,
            );
          case APIResponseCode.badRequest:
            return const Failure(
              APIResponseCode.badRequest,
              APIResponseMessages.badRequest,
            );
          case APIResponseCode.unauthorized:
            return const Failure(
              APIResponseCode.unauthorized,
              APIResponseMessages.unauthorized,
            );
          case APIResponseCode.forbidden:
            return const Failure(
                APIResponseCode.forbidden, APIResponseMessages.forbidden);
          case APIResponseCode.notFound:
            return const Failure(
                APIResponseCode.notFound, APIResponseMessages.notFound);
          case APIResponseCode.noContent:
            return const Failure(
                APIResponseCode.noContent, APIResponseMessages.noContent);
          case APIResponseCode.internalServerError:
            return const Failure(APIResponseCode.internalServerError,
                APIResponseMessages.internalServerError);
          default:
            return const Failure(
                APIResponseCode.unknown, APIResponseMessages.unknown);
        }
      case DioExceptionType.cancel:
        return const Failure(
            APIResponseCode.cancel, APIResponseMessages.cancel);
      case DioExceptionType.badCertificate:
        return const Failure(
          APIResponseCode.badRequest,
          APIResponseMessages.badRequest,
        );
      case DioExceptionType.connectionError:
        return const Failure(
            APIResponseCode.connectTimeout, APIResponseMessages.connectTimeout);
      case DioExceptionType.unknown:
        return const Failure(
          APIResponseCode.unknown,
          APIResponseMessages.unknown,
        );
    }
  }
}
