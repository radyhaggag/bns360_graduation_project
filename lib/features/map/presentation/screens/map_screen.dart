import 'dart:async';

import 'package:bns360_graduation_project/core/utils/extensions/context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../../core/helpers/location_helper.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/widgets/buttons/custom_buttons.dart';
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
  final _completer = Completer<GoogleMapController>();
  GoogleMapController? miniController;
  GoogleMapController? fullController;

  double zoom = 16;

  GoogleMapController? get controller {
    if (isInBottomSheet) {
      return fullController;
    }
    return miniController;
  }

  Position? currentLocation;
  LatLng selectedPoint = const LatLng(29.0666664, 31.083333);
  late CameraPosition _kGooglePlex;
  String? title;
  Set<Marker> markers = {};

  @override
  void initState() {
    super.initState();

    isInBottomSheet = widget.mapParams?.isReadOnly ?? false;

    if (widget.mapParams?.lat == null || widget.mapParams?.lng == null) {
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
      zoom: zoom,
    );

    markers.add(
      Marker(
        markerId: const MarkerId('1'),
        position: selectedPoint,
      ),
    );
  }

  _getCurrentLocation() async {
    currentLocation ??= await LocationHelper.determinePosition(context);
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
    if (widget.mapParams?.isReadOnly == true) return;
    selectedPoint = LatLng(lat, lng);

    widget.mapParams?.onTap?.call(lat, lng);

    controller?.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: selectedPoint,
          zoom: zoom,
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
    if (!_completer.isCompleted) {
      _completer.complete(controller);
    }
    if (widget.mapParams?.isMinimized == true) {
      miniController = controller;
    } else {
      fullController = controller;
    }
    // Wait until the map is fully rendered before moving the camera.
    Future.delayed(const Duration(milliseconds: 500), () {
      _onTap(
        _kGooglePlex.target.latitude,
        _kGooglePlex.target.longitude,
      );
    });
    setState(() {});
  }

  bool isInBottomSheet = false;

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
              completer: _completer,
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
              isInBottomSheet = true;
              await showModalBottomSheet(
                isScrollControlled: true,
                isDismissible: false,
                enableDrag: false,
                context: context,
                useRootNavigator: true,
                builder: (context) {
                  return MapWidget(
                    isFullMode: true,
                    completer: _completer,
                    zoomControlsEnabled: false,
                    markers: markers,
                    onTap: _onTap,
                    addSearchField: true,
                    kGooglePlex: _kGooglePlex,
                    onMapCreated: (controller) {
                      fullController = controller;
                      controller.animateCamera(
                        CameraUpdate.newCameraPosition(
                          CameraPosition(
                            target: selectedPoint,
                            zoom: zoom,
                          ),
                        ),
                      );
                    },
                  );
                },
              );
              isInBottomSheet = false;
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
      floatingActionButton: _buildFloatingActionBtn(context),
      body: Stack(
        alignment: AlignmentDirectional.bottomStart,
        children: [
          MapWidget(
            completer: _completer,
            zoomControlsEnabled: false,
            markers: markers,
            onTap: _onTap,
            kGooglePlex: _kGooglePlex,
            onMapCreated: _onMapCreated,
          ),
          if ((widget.mapParams?.isReadOnly == true))
            Container(
              margin: const EdgeInsets.all(8),
              child: CustomIconButton(
                icon: const Icon(Icons.location_searching_outlined),
                backgroundColor: context.theme.cardColor,
                foregroundColor: context.theme.highlightColor,
                onPressed: () {
                  final params = widget.mapParams!;
                  title = params.location;
                  if (params.lat != null && params.lng != null) {
                    selectedPoint = LatLng(params.lat!, params.lng!);
                  }
                  _kGooglePlex = CameraPosition(
                    target: selectedPoint,
                    zoom: zoom,
                  );
                  controller?.animateCamera(
                    CameraUpdate.newCameraPosition(
                      CameraPosition(
                        target: selectedPoint,
                        zoom: zoom,
                      ),
                    ),
                  );
                },
              ),
            )
        ],
      ),
    );
  }

  FloatingActionButton _buildFloatingActionBtn(BuildContext context) {
    return FloatingActionButton(
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
      child: (widget.mapParams?.isReadOnly == true)
          ? const Icon(Icons.close)
          : const Icon(Icons.check),
    );
  }
}
