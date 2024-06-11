import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapWidget extends StatefulWidget {
  const MapWidget({
    super.key,
    required this.controller,
    required this.zoomControlsEnabled,
    required this.onTap,
    required this.kGooglePlex,
    required this.completer,
    required this.markers,
    this.onMapCreated,
  });

  final Completer<GoogleMapController> completer;
  final GoogleMapController? controller;
  final bool zoomControlsEnabled;
  final Set<Marker> markers;
  final Function(double lat, double lng) onTap;
  final CameraPosition kGooglePlex;
  final Function(GoogleMapController)? onMapCreated;

  @override
  State<MapWidget> createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      buildingsEnabled: true,
      zoomControlsEnabled: widget.zoomControlsEnabled,
      markers: widget.markers,
      onMapCreated: widget.onMapCreated,
      onTap: (point) {
        widget.onTap.call(point.latitude, point.longitude);
        setState(() {});
      },
      initialCameraPosition: widget.kGooglePlex,
    );
  }
}
