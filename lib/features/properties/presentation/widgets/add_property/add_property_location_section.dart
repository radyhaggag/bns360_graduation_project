import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';

import '../../../../../core/helpers/location_helper.dart';
import '../../../../../core/utils/extensions/media_query.dart';
import '../../../../../core/widgets/custom_marker.dart';
import '../../bloc/properties_bloc.dart';

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
  LatLng? centerPoint;
  List<Marker> markers = [];

  @override
  void initState() {
    super.initState();
    _mapController = MapController();
    _getCurrentLocation();
  }

  _getCurrentLocation() async {
    currentLocation = await LocationHelper.determinePosition(context);
    if (currentLocation != null) {
      centerPoint = LatLng(
        currentLocation!.latitude,
        currentLocation!.longitude,
      );
      markers.add(
        Marker(
          point: centerPoint!,
          child: const CustomMarker(),
        ),
      );
      _mapController.move(centerPoint!, 9);
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
            initialCenter: centerPoint ?? const LatLng(50.5, 30.51),
            initialZoom: 9.2,
            minZoom: 5.2,
            maxZoom: 18.2,
            onTap: (tapPosition, point) {
              context.read<PropertiesBloc>().add(
                    SelectPropertyLocationEvent(
                      lat: point.latitude,
                      lng: point.longitude,
                    ),
                  );
              markers.clear();
              centerPoint = point;
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
