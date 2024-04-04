import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';

import '../../../../../core/helpers/location_helper.dart';
import '../../../../../core/utils/extensions/media_query.dart';
import 'custom_marker.dart';

class AddPropertyLocationSection extends StatefulWidget {
  const AddPropertyLocationSection({super.key});

  @override
  State<AddPropertyLocationSection> createState() =>
      _AddPropertyLocationSectionState();
}

class _AddPropertyLocationSectionState
    extends State<AddPropertyLocationSection> {
  late MapController _mapController;
  Position? currentLocation;
  LatLng? initialCenter;
  List<Marker> markers = [];

  @override
  void initState() {
    super.initState();
    _mapController = MapController();
    _getCurrentLocation();
  }

  _getCurrentLocation() async {
    currentLocation = await LocationHelper.determinePosition();
    if (currentLocation != null) {
      initialCenter = LatLng(
        currentLocation!.latitude,
        currentLocation!.longitude,
      );
      markers.add(
        Marker(
          point: initialCenter!,
          child: const CustomMarker(),
        ),
      );
      _mapController.move(initialCenter!, 9);
      setState(() {});
    }
  }

  @override
  void dispose() {
    _mapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width * .9,
      height: 150.h,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: FlutterMap(
          mapController: _mapController,
          options: MapOptions(
            initialCenter: initialCenter ?? const LatLng(50.5, 30.51),
            initialZoom: 9.2,
            onTap: (tapPosition, point) {
              markers.clear();
              initialCenter = point;
              markers.add(
                Marker(
                  point: point,
                  child: const CustomMarker(),
                ),
              );
              setState(() {});
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
      ),
    );
  }

  String get urlTemplate {
    return "https://tile.openstreetmap.org/{z}/{x}/{y}.png";
  }
}
