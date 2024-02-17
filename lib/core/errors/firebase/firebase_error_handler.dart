import 'package:firebase_core/firebase_core.dart';

import '../failure.dart';
import 'firebase_error_codes.dart';
import 'firebase_error_messages.dart';

abstract class FirebaseErrorHandler {
  static Failure handleFirebaseErrors(FirebaseException exception) {
    switch (exception.code) {
      //* FIRESTORE SECTION START *//
      case FirebaseErrorCodes.aborted:
        return const Failure(
          FirebaseErrorCodes.aborted,
          general.aborted,
        );
      case FirebaseErrorCodes.alreadyExists:
        return const Failure(
          FirebaseErrorCodes.alreadyExists,
          general.alreadyExists,
        );
      case FirebaseErrorCodes.cancelled:
        return const Failure(
          FirebaseErrorCodes.cancelled,
          general.cancelled,
        );
      case FirebaseErrorCodes.dataLoss:
        return const Failure(
          FirebaseErrorCodes.dataLoss,
          general.dataLoss,
        );
      case FirebaseErrorCodes.deadlineExceeded:
        return const Failure(
          FirebaseErrorCodes.deadlineExceeded,
          general.deadlineExceeded,
        );
      case FirebaseErrorCodes.failedPrecondition:
        return const Failure(
          FirebaseErrorCodes.failedPrecondition,
          general.failedPrecondition,
        );
      case FirebaseErrorCodes.internal:
        return const Failure(
          FirebaseErrorCodes.internal,
          general.internal,
        );
      case FirebaseErrorCodes.invalidArgument:
        return const Failure(
          FirebaseErrorCodes.invalidArgument,
          general.invalidArgument,
        );
      case FirebaseErrorCodes.notFound:
        return const Failure(
          FirebaseErrorCodes.notFound,
          general.notFound,
        );
      case FirebaseErrorCodes.ok:
        return const Failure(
          FirebaseErrorCodes.ok,
          general.ok,
        );
      case FirebaseErrorCodes.outOfRange:
        return const Failure(
          FirebaseErrorCodes.outOfRange,
          general.outOfRange,
        );
      case FirebaseErrorCodes.permissionDenied:
        return const Failure(
          FirebaseErrorCodes.permissionDenied,
          general.permissionDenied,
        );
      case FirebaseErrorCodes.resourceExhausted:
        return const Failure(
          FirebaseErrorCodes.resourceExhausted,
          general.resourceExhausted,
        );
      case FirebaseErrorCodes.unauthenticated:
        return const Failure(
          FirebaseErrorCodes.unauthenticated,
          general.unauthenticated,
        );
      case FirebaseErrorCodes.unavailable:
        return const Failure(
          FirebaseErrorCodes.unavailable,
          general.unavailable,
        );
      case FirebaseErrorCodes.unimplemented:
        return const Failure(
          FirebaseErrorCodes.unimplemented,
          general.unimplemented,
        );
      case FirebaseErrorCodes.unknown:
        return const Failure(
          FirebaseErrorCodes.unknown,
          general.unknown,
        );
      //* FIRESTORE SECTION END *//

      //* CLOUD STORAGE SECTION START *//
      case FirebaseErrorCodes.unknownError:
      case FirebaseErrorCodes.objectNotFoundError:
        return const Failure(
          FirebaseErrorCodes.objectNotFoundError,
          general.objectNotFoundError,
        );
      case FirebaseErrorCodes.bucketNotFoundError:
        return const Failure(
          FirebaseErrorCodes.bucketNotFoundError,
          general.bucketNotFoundError,
        );
      case FirebaseErrorCodes.projectNotFoundError:
        return const Failure(
          FirebaseErrorCodes.projectNotFoundError,
          general.projectNotFoundError,
        );
      case FirebaseErrorCodes.quotaExceededError:
        return const Failure(
          FirebaseErrorCodes.quotaExceededError,
          general.quotaExceededError,
        );
      case FirebaseErrorCodes.unauthenticatedError:
        return const Failure(
          FirebaseErrorCodes.unauthenticatedError,
          general.unauthenticatedError,
        );
      case FirebaseErrorCodes.unauthorizedError:
        return const Failure(
          FirebaseErrorCodes.unauthorizedError,
          general.unauthorizedError,
        );
      case FirebaseErrorCodes.retryLimitExceededError:
        return const Failure(
          FirebaseErrorCodes.retryLimitExceededError,
          general.retryLimitExceededError,
        );
      case FirebaseErrorCodes.invalidChecksumError:
        return const Failure(
          FirebaseErrorCodes.invalidChecksumError,
          general.invalidChecksumError,
        );
      case FirebaseErrorCodes.canceledError:
        return const Failure(
          FirebaseErrorCodes.canceledError,
          general.canceledError,
        );
      case FirebaseErrorCodes.invalidEventNameError:
        return const Failure(
          FirebaseErrorCodes.invalidEventNameError,
          general.invalidEventNameError,
        );
      case FirebaseErrorCodes.invalidUrlError:
        return const Failure(
          FirebaseErrorCodes.invalidUrlError,
          general.invalidUrlError,
        );
      case FirebaseErrorCodes.invalidArgumentError:
        return const Failure(
          FirebaseErrorCodes.invalidArgumentError,
          general.invalidArgumentError,
        );
      case FirebaseErrorCodes.noDefaultBucketError:
        return const Failure(
          FirebaseErrorCodes.noDefaultBucketError,
          general.noDefaultBucketError,
        );
      case FirebaseErrorCodes.cannotSliceBlobError:
        return const Failure(
          FirebaseErrorCodes.cannotSliceBlobError,
          general.cannotSliceBlobError,
        );
      case FirebaseErrorCodes.serverFileWrongSizeError:
        return const Failure(
          FirebaseErrorCodes.serverFileWrongSizeError,
          general.serverFileWrongSizeError,
        );

      //* CLOUD STORAGE SECTION END *//

      default:
        return const Failure(
          FirebaseErrorCodes.unexpectedError,
          general.unexpectedError,
        );
    }
  }
}
