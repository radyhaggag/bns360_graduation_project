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
import '../../../../../core/shared_data/entities/category_item_entity.dart';
import '../../../../../core/utils/extensions/media_query.dart';
import '../../../../../core/widgets/custom_marker.dart';
import '../../../../map/domain/params/map_params.dart';

class AddBusinessLocationSection extends StatefulWidget {
  const AddBusinessLocationSection({super.key, this.categoryItemEntity});

  final CategoryItemEntity? categoryItemEntity;

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
    if (widget.categoryItemEntity != null) {
      centerPoint = LatLng(
        widget.categoryItemEntity!.latitude,
        widget.categoryItemEntity!.longitude,
      );
    } else {
      _getCurrentLocation();
    }

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
          label: widget.categoryItemEntity != null
              ? S.of(context).edit_location
              : S.of(context).add_location,
          width: 150.w,
          onPressed: () {
            MapParams? mapParams;
            if (widget.categoryItemEntity != null) {
              mapParams = MapParams(
                location: widget.categoryItemEntity!.address,
                lat: widget.categoryItemEntity!.latitude,
                lng: widget.categoryItemEntity!.longitude,
              );
            }
            Navigator.of(context).pushNamed(
              Routes.map,
              arguments: mapParams,
            );
          },
          borderRadius: BorderRadius.circular(8.0),
        ),
      ],
    );
  }

  String get urlTemplate {
    return "https://tile.openstreetmap.org/{z}/{x}/{y}.png";
  }
}
