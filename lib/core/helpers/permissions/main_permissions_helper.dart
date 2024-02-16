import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../utils/main_logger.dart';
import 'permissions_dialogs.dart';

class MainPermissionHandler {
  static final MainPermissionHandler _instance = MainPermissionHandler._();
  MainPermissionHandler._();
  factory MainPermissionHandler() => _instance;

  Future<bool> requestLocationPermission(BuildContext context) async {
    final status = await Permission.location.request();
    logger.i("requestLocationPermission status $status");
    if (status.isGranted) {
      return true;
    } else {
      if (!context.mounted) return false;
      PermissionsDialogs.showPermissionDeniedDialog(
        context,
        Permission.location,
      );
      return false;
    }
  }

  Future<bool> requestCameraPermission(BuildContext context) async {
    final status = await Permission.camera.request();
    logger.i("requestLocationPermission status $status");

    if (status.isGranted) {
      return true;
    } else {
      if (!context.mounted) return false;
      PermissionsDialogs.showPermissionDeniedDialog(
        context,
        Permission.camera,
      );
      return false;
    }
  }

  Future<bool> requestStoragePermission(BuildContext context) async {
    final status = await Permission.storage.request();
    logger.i("requestLocationPermission status $status");

    if (status.isGranted) {
      return true;
    } else {
      if (!context.mounted) return false;
      PermissionsDialogs.showPermissionDeniedDialog(
        context,
        Permission.storage,
      );
      return false;
    }
  }
}
