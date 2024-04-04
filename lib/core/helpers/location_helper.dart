import 'package:bns360_graduation_project/core/utils/main_logger.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

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

  static Future<List<Placemark>> getLocationByCoordinates(
    double lat,
    double lng,
  ) async {
    List<Placemark> placemarks = await placemarkFromCoordinates(lat, lng);
    return placemarks;
  }
}
