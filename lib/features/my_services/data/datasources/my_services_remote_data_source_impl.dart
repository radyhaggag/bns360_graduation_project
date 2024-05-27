import 'package:bns360_graduation_project/core/providers/app_provider.dart';
import 'package:bns360_graduation_project/core/shared_data/entities/craftsman_entity.dart';
import 'package:bns360_graduation_project/core/utils/app_endpoints.dart';
import 'package:bns360_graduation_project/core/utils/extensions/language.dart';
import 'package:dio/dio.dart';
import 'package:translator/translator.dart';

import '../../../../core/api/api_consumer.dart';
import '../../../../core/helpers/load_json_from_asset.dart';
import '../../../../core/shared_data/entities/contact_entity.dart';
import '../../../../core/shared_data/models/craft_model.dart';
import '../../../../core/shared_data/models/craftsman_model.dart';
import '../../../../core/utils/enums.dart';
import '../../domain/params/add_service_params.dart';
import 'my_services_remote_data_source.dart';

class MyServicesRemoteDataSourceImpl implements MyServicesRemoteDataSource {
  final APIConsumer apiConsumer;

  MyServicesRemoteDataSourceImpl({
    required this.apiConsumer,
  });

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
      );
      final descriptionTranslation = await translator.translate(
        params.serviceDescription,
      );
      final addressTranslation = await translator.translate(
        params.serviceAddress,
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
      );
      final descriptionTranslation = await translator.translate(
        params.serviceDescription,
      );
      final addressTranslation = await translator.translate(
        params.serviceAddress,
      );
      titleAR = titleTranslation.text;
      aboutAR = descriptionTranslation.text;
      addressAR = addressTranslation.text;
    }

    final userId = AppProvider().getProfile()!.id;

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
      imageName1: params.mainServiceBackgroundImages[0],
      imageName2: params.mainServiceBackgroundImages[1],
      imageName3: params.mainServiceBackgroundImages[2],
      imageName4: params.mainServiceBackgroundImages[3],
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
    final res = await loadJsonFromAsset('crafts.json');
    final crafts = List<CraftModel>.from(res['data'].map(
      (category) => CraftModel.fromJson(category),
    ));
    return crafts;
  }

  @override
  Future<List<CraftsmanModel>> getMyServices() async {
    final res = await loadJsonFromAsset('craftsmen.json');
    final items = List<CraftsmanModel>.from(res['data'].map(
      (item) => CraftsmanModel.fromJson(item),
    ));
    return items;
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
}
