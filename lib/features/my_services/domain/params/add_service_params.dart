import '../../../../core/shared_data/entities/craft_entity.dart';
import '../../../../core/utils/enums/work_days.dart';

class AddServiceParams {
  final String serviceName;
  final String serviceDescription;
  final String serviceAddress;
  final String phoneNumber;
  final int from;
  final int to;
  final WorkDay holiday;
  final String mainServiceImage;
  final List<String> mainServiceBackgroundImages;
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
    required this.holiday,
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
    WorkDay? holiday,
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
      holiday: holiday ?? this.holiday,
      serviceCategory: serviceCategory ?? this.serviceCategory,
    );
  }
}
