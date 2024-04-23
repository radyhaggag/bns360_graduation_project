import '../../../../core/shared_data/entities/craft_entity.dart';

class AddServiceParams {
  final String serviceName;
  final String serviceDescription;
  final String serviceAddress;
  final String phoneNumber;
  final int from;
  final int to;
  final String mainServiceImage;
  final List<String> mainServiceBackgroundImages;
  final double? lat;
  final double? lng;
  final CraftEntity? serviceCategory;

  const AddServiceParams({
    required this.serviceName,
    required this.serviceDescription,
    required this.serviceAddress,
    required this.phoneNumber,
    required this.from,
    required this.to,
    required this.mainServiceImage,
    required this.mainServiceBackgroundImages,
    this.lat,
    this.lng,
    this.serviceCategory,
  });

  AddServiceParams copyWith({
    String? serviceName,
    String? serviceDescription,
    String? serviceAddress,
    String? phoneNumber,
    int? from,
    int? to,
    String? mainServiceImage,
    List<String>? mainServiceBackgroundImages,
    double? lat,
    double? lng,
    CraftEntity? serviceCategory,
  }) {
    return AddServiceParams(
      serviceName: serviceName ?? this.serviceName,
      serviceDescription: serviceDescription ?? this.serviceDescription,
      serviceAddress: serviceAddress ?? this.serviceAddress,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      from: from ?? this.from,
      to: to ?? this.to,
      mainServiceImage: mainServiceImage ?? this.mainServiceImage,
      mainServiceBackgroundImages:
          mainServiceBackgroundImages ?? this.mainServiceBackgroundImages,
      lat: lat ?? this.lat,
      lng: lng ?? this.lng,
      serviceCategory: serviceCategory ?? this.serviceCategory,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'serviceName': serviceName,
      'serviceDescription': serviceDescription,
      'serviceAddress': serviceAddress,
      'phoneNumber': phoneNumber,
      'from': from,
      'to': to,
      'mainServiceImage': mainServiceImage,
      'mainServiceBackgroundImages': mainServiceBackgroundImages,
      'lat': lat,
      'lng': lng,
    };
  }
}
