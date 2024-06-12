import 'dart:async';

import 'package:bns360_graduation_project/core/helpers/location_helper.dart';
import 'package:bns360_graduation_project/core/utils/app_colors.dart';
import 'package:bns360_graduation_project/core/widgets/buttons/custom_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapWidget extends StatefulWidget {
  const MapWidget({
    super.key,
    required this.zoomControlsEnabled,
    required this.onTap,
    required this.kGooglePlex,
    required this.completer,
    required this.markers,
    this.onMapCreated,
    this.isFullMode = false,
  });

  final Completer<GoogleMapController> completer;
  final bool zoomControlsEnabled;
  final Set<Marker> markers;
  final Function(double lat, double lng) onTap;
  final CameraPosition kGooglePlex;
  final Function(GoogleMapController)? onMapCreated;
  final bool isFullMode;

  @override
  State<MapWidget> createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  Position? currentLocation;
  late LatLng selectedPoint;
  late Set<Marker> markers;

  @override
  void initState() {
    super.initState();
    markers = widget.markers;
    selectedPoint = widget.kGooglePlex.target;
  }

  _getCurrentLocation() async {
    currentLocation ??= await LocationHelper.determinePosition(context);
    if (currentLocation != null) {
      selectedPoint = LatLng(
        currentLocation!.latitude,
        currentLocation!.longitude,
      );
      widget.onTap(
        selectedPoint.latitude,
        selectedPoint.longitude,
      );
    }

    markers.clear();

    markers.add(
      Marker(
        markerId: const MarkerId('1'),
        position: selectedPoint,
      ),
    );

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GoogleMap(
          buildingsEnabled: true,
          myLocationButtonEnabled: false,
          myLocationEnabled: true,
          zoomControlsEnabled: widget.zoomControlsEnabled,
          markers: markers,
          onMapCreated: widget.onMapCreated,
          onTap: (point) {
            selectedPoint = point;
            widget.onTap.call(point.latitude, point.longitude);
            setState(() {});
          },
          initialCameraPosition: widget.kGooglePlex,
        ),
        if (widget.isFullMode)
          Positioned.directional(
            textDirection: Directionality.of(context),
            end: 25,
            bottom: 50,
            child: Column(
              children: [
                CustomIconButton(
                  icon: const Icon(
                    Icons.my_location,
                    color: AppColors.white,
                  ),
                  backgroundColor: AppColors.primary,
                  onPressed: _getCurrentLocation,
                ),
                SizedBox(height: 10.h),
                _buildFloatingActionBtn(context),
              ],
            ),
          ),
      ],
    );
  }

  FloatingActionButton _buildFloatingActionBtn(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        widget.onTap(
          selectedPoint.latitude,
          selectedPoint.longitude,
        );
        Navigator.of(context).pop(
          selectedPoint,
        );
      },
      backgroundColor: AppColors.primary,
      foregroundColor: AppColors.white,
      child: const Icon(Icons.check),
    );
  }
}
