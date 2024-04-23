import 'package:bns360_graduation_project/config/route_config.dart';
import 'package:bns360_graduation_project/core/widgets/buttons/custom_buttons.dart';
import 'package:bns360_graduation_project/features/my_business/presentation/bloc/my_business_bloc.dart';
import 'package:bns360_graduation_project/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';

import '../../../../../core/helpers/location_helper.dart';
import '../../../../../core/utils/extensions/media_query.dart';
import '../../../../../core/widgets/custom_marker.dart';

class AddBusinessLocationSection extends StatefulWidget {
  const AddBusinessLocationSection({super.key});

  @override
  State<AddBusinessLocationSection> createState() =>
      _AddBusinessLocationSectionState();
}

class _AddBusinessLocationSectionState
    extends State<AddBusinessLocationSection> {
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        SizedBox(
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
                  context.read<MyBusinessBloc>().add(
                        SelectBusinessLocationEvent(
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
                TileLayer(urlTemplate: urlTemplate),
                MarkerLayer(markers: markers, alignment: Alignment.center),
              ],
            ),
          ),
        ),
        const SizedBox(height: 15),
        CustomElevatedButton(
          label: S.of(context).add_location,
          width: 150.w,
          onPressed: () => Navigator.of(context).pushNamed(Routes.map),
          borderRadius: BorderRadius.circular(8.0),
        ),
      ],
    );
  }

  String get urlTemplate {
    return "https://tile.openstreetmap.org/{z}/{x}/{y}.png";
  }
}
