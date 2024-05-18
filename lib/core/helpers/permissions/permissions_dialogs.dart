import '../../utils/app_colors.dart';
import '../../utils/extensions/context.dart';
import '../../../generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

import 'main_permissions_helper.dart';

abstract class PermissionsDialogs {
  static void showPermissionDeniedDialog(
    BuildContext context,
    Permission permission,
  ) {
    final msg = _getPermissionText(context, permission);
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: context.theme.listTileTheme.tileColor,
          title: Text(S.of(context).permission_denied),
          content: Text(
            msg,
          ),
          actions: [
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                backgroundColor: AppColors.red,
                foregroundColor: AppColors.white,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(S.of(context).cancel),
            ),
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: AppColors.white,
              ),
              onPressed: () async {
                Navigator.of(context).pop();
                _getPermissionRequest(context, permission);
              },
              child: Text(S.of(context).ok),
            ),
          ],
        );
      },
    );
  }

  static String _getPermissionText(
    BuildContext context,
    Permission permission,
  ) {
    if (permission == Permission.location) {
      return S.of(context).access_location_permission_msg;
    } else if (permission == Permission.camera) {
      return S.of(context).access_camera_permissions_msg;
    } else if (permission == Permission.storage) {
      return S.of(context).access_storage_permissions_msg;
    } else {
      return "";
    }
  }

  static Future<void> _getPermissionRequest(
    BuildContext context,
    Permission permission,
  ) async {
    if (permission == Permission.location) {
      await MainPermissionHandler().requestLocationPermission(context);
    } else if (permission == Permission.camera) {
      await MainPermissionHandler().requestCameraPermission(context);
    } else if (permission == Permission.storage) {
      await MainPermissionHandler().requestStoragePermission(context);
    } else {}
  }
}
