import 'package:bns360_graduation_project/core/utils/main_logger.dart';
import 'package:bns360_graduation_project/core/widgets/custom_back_button.dart';
import 'package:bns360_graduation_project/features/map/domain/params/map_params.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';

import '../../../../../core/helpers/location_helper.dart';
import '../../../../core/widgets/custom_marker.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key, this.mapParams});
  final MapParams? mapParams;

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late MapController _mapController;
  Position? currentLocation;
  LatLng? selectedPoint;
  List<Marker> markers = [];

  @override
  void initState() {
    super.initState();
    _mapController = MapController();
    if (widget.mapParams == null) {
      _getCurrentLocation();
    } else {
      final params = widget.mapParams!;
      title = params.location;
      selectedPoint = LatLng(params.lat, params.lng);
    }
  }

  _getCurrentLocation() async {
    currentLocation = await LocationHelper.determinePosition(context);
    if (currentLocation != null) {
      selectedPoint = LatLng(
        currentLocation!.latitude,
        currentLocation!.longitude,
      );
      markers.add(
        Marker(
          point: selectedPoint!,
          child: const CustomMarker(),
        ),
      );
      _mapController.move(selectedPoint!, 9);
      _getLocationTitleForSelectedPoint(update: false);
      setState(() {});
    }
  }

  Future<void> _getLocationTitleForSelectedPoint({bool update = true}) async {
    if (selectedPoint == null) return;
    final placemarks = await LocationHelper.getLocationByCoordinates(
      selectedPoint!.latitude,
      selectedPoint!.longitude,
    );
    logger.i("placemarks $placemarks");
    if (placemarks.isEmpty) return;
    title = placemarks.first.street ??
        placemarks.first.name ??
        placemarks.first.locality;
    setState(() {});
  }

  String? title;

  @override
  void dispose() {
    _mapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: FittedBox(
          child: Text(title ?? ""),
        ),
        leading: const CustomBackButton(),
        actions: const [SizedBox(width: 20)],
      ),
      body: FlutterMap(
        mapController: _mapController,
        options: MapOptions(
          initialCenter: selectedPoint ?? const LatLng(50.5, 30.51),
          initialZoom: 9.2,
          onTap: (tapPosition, point) {
            markers.clear();
            selectedPoint = point;
            markers.add(
              Marker(
                point: point,
                child: const CustomMarker(),
              ),
            );
            _getLocationTitleForSelectedPoint(update: true);
          },
        ),
        children: [
          TileLayer(
            urlTemplate: urlTemplate,
          ),
          MarkerLayer(
            markers: markers,
            alignment: Alignment.center,
          ),
        ],
      ),
    );
  }

  String get urlTemplate {
    return "https://tile.openstreetmap.org/{z}/{x}/{y}.png";
  }
}
