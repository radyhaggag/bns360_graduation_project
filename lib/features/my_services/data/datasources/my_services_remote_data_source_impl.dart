import 'package:bns360_graduation_project/core/providers/app_provider.dart';
import 'package:bns360_graduation_project/core/shared_data/entities/craftsman_entity.dart';
import 'package:bns360_graduation_project/core/utils/app_endpoints.dart';
import 'package:bns360_graduation_project/core/utils/extensions/language.dart';
import 'package:dio/dio.dart';
import 'package:translator/translator.dart';

import '../../../../core/api/api_consumer.dart';
import '../../../../core/shared_data/entities/contact_entity.dart';
import '../../../../core/shared_data/models/craft_model.dart';
import '../../../../core/shared_data/models/craftsman_model.dart';
import '../../../../core/shared_data/models/review_summary_model.dart';
import '../../../../core/utils/enums.dart';
import '../../domain/params/add_service_params.dart';
import 'my_services_remote_data_source.dart';

class MyServicesRemoteDataSourceImpl implements MyServicesRemoteDataSource {
  final APIConsumer apiConsumer;

  MyServicesRemoteDataSourceImpl({
    required this.apiConsumer,
  });

  String get userId => AppProvider().getProfile()!.id;

  @override
  Future<void> addService(AddServiceParams params) async {
    final translator = GoogleTranslator();
    late String titleAR;
    late String titleENG;
    late String aboutAR;
    late String aboutENG;
    late String addressAR;
    late String addressENG;

    if (params.serviceName.detectLanguage == Language.arabic) {
      titleAR = params.serviceName;
      aboutAR = params.serviceDescription;
      addressAR = params.serviceAddress;
      final titleTranslation = await translator.translate(
        params.serviceName,
        from: "ar",
        to: "en",
      );
      final descriptionTranslation = await translator.translate(
        params.serviceDescription,
        from: "ar",
        to: "en",
      );
      final addressTranslation = await translator.translate(
        params.serviceAddress,
        from: "ar",
        to: "en",
      );
      titleENG = titleTranslation.text;
      aboutENG = descriptionTranslation.text;
      addressENG = addressTranslation.text;
    } else {
      titleENG = params.serviceName;
      aboutENG = params.serviceDescription;
      addressENG = params.serviceAddress;
      final titleTranslation = await translator.translate(
        params.serviceName,
        from: "en",
        to: "ar",
      );
      final descriptionTranslation = await translator.translate(
        params.serviceDescription,
        from: "en",
        to: "ar",
      );
      final addressTranslation = await translator.translate(
        params.serviceAddress,
        from: "en",
        to: "ar",
      );
      titleAR = titleTranslation.text;
      aboutAR = descriptionTranslation.text;
      addressAR = addressTranslation.text;
    }

    final images = params.mainServiceBackgroundImages;

    final categoryItemModel = CraftsmanModel(
      userId: userId,
      id: -1,
      nameAR: titleAR,
      nameEN: titleENG,
      descriptionAR: aboutAR,
      descriptionEN: aboutENG,
      addressAR: addressAR,
      addressEN: addressENG,
      contact: ContactEntity(phoneNumber: params.phoneNumber),
      craft: CraftModel.empty(), // will not added
      craftsModelId: params.serviceCategory!.id,
      closing: params.to,
      opening: params.from,
      holidays: params.holiday.id,
      profileImageUrl: params.mainServiceImage,
      imageName1: images.isNotEmpty ? images[0] : null,
      imageName2: images.length > 1 ? images[1] : null,
      imageName3: images.length > 2 ? images[2] : null,
      imageName4: images.length > 3 ? images[3] : null,
    );

    final FormData formData = FormData.fromMap(
      await categoryItemModel.toJson(),
    );

    await apiConsumer.post(
      endpoint: AppEndpoints.addCraftsman,
      formData: formData,
    );
  }

  @override
  Future<List<CraftModel>> getServiceCategories() async {
    final res = await apiConsumer.get(
      endpoint: AppEndpoints.getAllCrafts,
    );
    final crafts = List<CraftModel>.from(res.data.map(
      (craft) => CraftModel.fromJson(craft),
    ));
    return crafts;
  }

  @override
  Future<List<CraftsmanModel>> getMyServices() async {
    final res = await apiConsumer.get(
      endpoint: AppEndpoints.getMyCraftsman(userId),
    );
    final item = await _mapAndGetCraftsmanModel(res.data);
    return [item];
  }

  Future<CraftsmanModel> _mapAndGetCraftsmanModel(
    Map<String, dynamic> json,
  ) async {
    CraftsmanModel model = CraftsmanModel.fromJson(json);

    final res = await apiConsumer.get(
      endpoint: AppEndpoints.getCraftsmanReviewSummary(model.id),
    );
    final reviewSummary = ReviewSummaryModel.fromJson(res.data);
    model = CraftsmanModel.fromEntity(
      model.copyWith(reviewSummary: reviewSummary),
    );

    return model;
  }

  @override
  Future<void> updateService(CraftsmanEntity params) async {
    final model = CraftsmanModel.fromEntity(params);

    final FormData formData = FormData.fromMap(
      await model.toJson(),
    );

    await apiConsumer.put(
      endpoint: AppEndpoints.updateCraftsman(params.id),
      formData: formData,
    );
  }

  @override
  Future<void> deleteService(int serviceId) async {
    await apiConsumer.delete(
      endpoint: AppEndpoints.deleteCraftsman(serviceId),
    );
  }
}
