import 'package:bns360_graduation_project/core/helpers/custom_toast.dart';
import 'package:bns360_graduation_project/core/helpers/execute_and_handle_error.dart';
import 'package:in_app_update/in_app_update.dart';

import '../../generated/l10n.dart';

abstract class UpdateHelper {
  static AppUpdateInfo? _appUpdateInfo;

  static Future<void> checkForInAppUpdate() async {
    await executeAndHandleErrorAsync(() async {
      final updateInfo = await InAppUpdate.checkForUpdate();
      _appUpdateInfo = updateInfo;
      _checkForUpdateAvailability();
    });
  }

  static bool isUpdateAvailable() {
    if (_appUpdateInfo != null) {
      return _appUpdateInfo!.updateAvailability ==
          UpdateAvailability.updateAvailable;
    }
    return false;
  }

  static bool isImmediateUpdatePossible() {
    if (_appUpdateInfo != null) {
      return _appUpdateInfo!.immediateUpdateAllowed;
    }

    return false;
  }

  static bool isFlexibleUpdatePossible() {
    if (_appUpdateInfo != null) {
      return _appUpdateInfo!.flexibleUpdateAllowed;
    }

    return false;
  }

  static Future<void> applyImmediateUpdate() async {
    await InAppUpdate.performImmediateUpdate().then(
      (appUpdateResult) {
        return {
          if (appUpdateResult == AppUpdateResult.userDeniedUpdate)
            {}
          else if (appUpdateResult == AppUpdateResult.inAppUpdateFailed)
            {_onFailure()}
          else
            {_onSuccess()}
        };
      },
    ).catchError(
      (onError) => _onFailure(),
    );
  }

  static Future<void> startFlexibleUpdate() async {
    AppUpdateResult appUpdateResult = await InAppUpdate.startFlexibleUpdate();
    if (appUpdateResult == AppUpdateResult.success) {
      await InAppUpdate.completeFlexibleUpdate();
    }
  }

  static Future<void> _checkForUpdateAvailability() async {
    bool needToUpdate = isUpdateAvailable();
    if (needToUpdate) {
      bool isImmediateUpdateAvailable = isImmediateUpdatePossible();
      if (isImmediateUpdateAvailable) {
        await applyImmediateUpdate();
      } else {
        bool isFlexibleUpdateAvailable = isFlexibleUpdatePossible();
        if (isFlexibleUpdateAvailable) {
          await startFlexibleUpdate();
        }
      }
    }
  }
}

_onFailure() {
  showToast(S.current.app_update_failed, ToastType.error);
}

_onSuccess() {
  showToast(S.current.app_update_success, ToastType.success);
}
