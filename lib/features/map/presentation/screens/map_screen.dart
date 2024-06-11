import 'dart:async';

import 'package:bns360_graduation_project/core/utils/app_colors.dart';
import 'package:bns360_graduation_project/core/widgets/buttons/custom_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../../core/helpers/location_helper.dart';
import '../../../../core/widgets/custom_back_button.dart';
import '../../../../generated/l10n.dart';
import '../../domain/params/map_params.dart';
import '../components/map_widget.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({
    super.key,
    this.mapParams,
  });
  final MapParams? mapParams;

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final _controller = Completer<GoogleMapController>();
  GoogleMapController? controller;
  Position? currentLocation;
  LatLng selectedPoint = const LatLng(29.0666664, 31.083333);
  late CameraPosition _kGooglePlex;
  String? title;
  Set<Marker> markers = {};

  @override
  void initState() {
    super.initState();

    if (widget.mapParams == null) {
      _getCurrentLocation();
    } else {
      final params = widget.mapParams!;
      title = params.location;
      if (params.lat != null && params.lng != null) {
        selectedPoint = LatLng(params.lat!, params.lng!);
      }
    }
    _kGooglePlex = CameraPosition(
      target: selectedPoint,
      zoom: 14.4746,
    );
  }

  _getCurrentLocation() async {
    currentLocation = await LocationHelper.determinePosition(context);
    if (currentLocation != null) {
      _onTap(
        currentLocation!.latitude,
        currentLocation!.longitude,
      );
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  _onTap(double lat, double lng) {
    selectedPoint = LatLng(lat, lng);

    widget.mapParams?.onTap?.call(lat, lng);

    controller?.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: selectedPoint,
          zoom: 14.4746,
        ),
      ),
    );

    markers.clear();
    markers.add(
      Marker(
        markerId: const MarkerId('1'),
        position: selectedPoint,
      ),
    );
  }

  _onMapCreated(GoogleMapController controller) async {
    if (!_controller.isCompleted) {
      _controller.complete(controller);
    }
    this.controller = await _controller.future;
    _onTap.call(
      _kGooglePlex.target.latitude,
      _kGooglePlex.target.longitude,
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (widget.mapParams?.isMinimized == true) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: AppColors.grey),
            ),
            height: 150.h,
            child: MapWidget(
              completer: _controller,
              controller: controller,
              zoomControlsEnabled: true,
              markers: markers,
              onTap: _onTap,
              kGooglePlex: _kGooglePlex,
              onMapCreated: _onMapCreated,
            ),
          ),
          const SizedBox(height: 10),
          CustomElevatedButton(
            width: 150.w,
            height: 40.h,
            borderRadius: BorderRadius.circular(8),
            label: S.of(context).add_location,
            onPressed: () async {
              await showModalBottomSheet(
                isScrollControlled: true,
                isDismissible: false,
                enableDrag: false,
                context: context,
                useRootNavigator: true,
                builder: (context) {
                  return Stack(
                    alignment: AlignmentDirectional.bottomEnd,
                    children: [
                      MapWidget(
                        completer: _controller,
                        controller: controller,
                        zoomControlsEnabled: false,
                        markers: markers,
                        onTap: _onTap,
                        kGooglePlex: _kGooglePlex,
                        onMapCreated: _onMapCreated,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: FloatingActionButton(
                          onPressed: () {
                            _onTap(
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
                        ),
                      ),
                    ],
                  );
                },
              );
              _onTap(selectedPoint.latitude, selectedPoint.longitude);
            },
          ),
        ],
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(title ?? S.of(context).add_location),
        ),
        leading: CustomBackButton(
          onPressed: () {
            _onTap(
              selectedPoint.latitude,
              selectedPoint.longitude,
            );
            Navigator.of(context).pop();
          },
        ),
        actions: const [SizedBox(width: 20)],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _onTap(
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
      ),
      body: MapWidget(
        completer: _controller,
        controller: controller,
        zoomControlsEnabled: false,
        markers: markers,
        onTap: _onTap,
        kGooglePlex: _kGooglePlex,
        onMapCreated: _onMapCreated,
      ),
    );
  }
}
