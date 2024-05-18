import '../../../../core/shared_data/entities/category_entity.dart';
import '../../../../core/utils/enums/work_days.dart';

class AddBusinessParams {
  final String businessName;
  final String businessDescription;
  final String businessAddress;
  final String phoneNumber;
  final int from;
  final int to;
  final String mainBusinessImage;
  final List<String> mainBusinessBackgroundImages;
  final double? lat;
  final double? lng;
  final CategoryEntity? businessCategory;
  final WorkDay holiday;

  const AddBusinessParams({
    required this.businessName,
    required this.businessDescription,
    required this.businessAddress,
    required this.phoneNumber,
    required this.from,
    required this.to,
    required this.mainBusinessImage,
    required this.mainBusinessBackgroundImages,
    this.lat,
    this.lng,
    this.businessCategory,
    required this.holiday,
  });

  AddBusinessParams copyWith({
    String? businessName,
    String? businessDescription,
    String? businessAddress,
    String? phoneNumber,
    int? from,
    int? to,
    String? mainBusinessImage,
    List<String>? mainBusinessBackgroundImages,
    double? lat,
    double? lng,
    CategoryEntity? businessCategory,
    WorkDay? holiday,
  }) {
    return AddBusinessParams(
      businessName: businessName ?? this.businessName,
      businessDescription: businessDescription ?? this.businessDescription,
      businessAddress: businessAddress ?? this.businessAddress,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      from: from ?? this.from,
      to: to ?? this.to,
      mainBusinessImage: mainBusinessImage ?? this.mainBusinessImage,
      mainBusinessBackgroundImages:
          mainBusinessBackgroundImages ?? this.mainBusinessBackgroundImages,
      lat: lat ?? this.lat,
      lng: lng ?? this.lng,
      businessCategory: businessCategory ?? this.businessCategory,
      holiday: holiday ?? this.holiday,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'businessName': businessName,
      'businessDescription': businessDescription,
      'businessAddress': businessAddress,
      'phoneNumber': phoneNumber,
      'from': from,
      'to': to,
      'mainBusinessImage': mainBusinessImage,
      'mainBusinessBackgroundImages': mainBusinessBackgroundImages,
      'lat': lat,
      'lng': lng,
    };
  }
}
