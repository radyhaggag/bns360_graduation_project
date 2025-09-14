import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

import '../utils/main_logger.dart';
import 'permissions/permissions_dialogs.dart';

abstract class LocationHelper {
  static Future<Position?> determinePosition(BuildContext context) async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!context.mounted) return null;
    if (!serviceEnabled) {
      PermissionsDialogs.showPermissionDeniedDialog(
        context,
        Permission.location,
      );
      return null;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied ||
          permission == LocationPermission.deniedForever) {
        if (!context.mounted) return null;

        PermissionsDialogs.showPermissionDeniedDialog(
          context,
          Permission.location,
        );
        return null;
      }
    }

    final location = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    logger.i("Current location $location");
    return location;
  }
}
