import 'package:bns360_graduation_project/core/utils/extensions/language.dart';
import 'package:dio/dio.dart';
import 'package:translator/translator.dart';

import '../../../../../core/api/api_consumer.dart';
import '../../../../../core/helpers/load_json_from_asset.dart';
import '../../../../../core/providers/app_provider.dart';
import '../../../../../core/shared_data/entities/contact_entity.dart';
import '../../../../../core/shared_data/entities/property_entity.dart';
import '../../../../../core/shared_data/entities/publisher_details_entity.dart';
import '../../../../../core/shared_data/models/property_model.dart';
import '../../../../../core/utils/app_endpoints.dart';
import '../../../../../core/utils/enums.dart';
import '../../../params/add_property_params.dart';
import 'properties_remote_data_source.dart';

class PropertiesRemoteDataSourceImpl implements PropertiesRemoteDataSource {
  final APIConsumer apiConsumer;

  PropertiesRemoteDataSourceImpl(this.apiConsumer);

  @override
  Future<List<PropertyModel>> getProperties() async {
    final res = await apiConsumer.get(
      endpoint: AppEndpoints.getAllProperties,
    );
    final data = res.data;
    final properties = List<PropertyModel>.from(data.map(
      (property) => PropertyModel.fromJson(property),
    ));
    return properties;
  }

  @override
  Future<PropertyModel> getPropertyById(String id) async {
    final res = await loadJsonFromAsset('properties.json');
    final properties = List<PropertyModel>.from(res['data'].map(
      (craftsman) => PropertyModel.fromJson(craftsman),
    ));
    final item = properties.firstWhere((item) => item.id == id);
    return item;
  }

  @override
  Future<void> addProperty(AddPropertyParams addPropertyParams) async {
    final translator = GoogleTranslator();

    late String addressAR;
    late String addressENG;
    late String descriptionAR;
    late String descriptionENG;

    if (addPropertyParams.description.detectLanguage == Language.arabic) {
      addressAR = addPropertyParams.address;
      final titleTranslation = await translator.translate(
        addPropertyParams.address,
        from: "ar",
        to: "en",
      );
      addressENG = titleTranslation.text;
      descriptionAR = addPropertyParams.description;
      final translation = await translator.translate(
        addPropertyParams.description,
        from: "ar",
        to: "en",
      );
      descriptionENG = translation.text;
    } else {
      addressENG = addPropertyParams.address;
      final titleTranslation = await translator.translate(
        addPropertyParams.address,
        from: "en",
        to: "ar",
      );
      addressAR = titleTranslation.text;
      descriptionENG = addPropertyParams.description;
      final translation = await translator.translate(
        addPropertyParams.description,
        from: "en",
        to: "ar",
      );
      descriptionAR = translation.text;
    }

    final contacts = ContactEntity(
      phoneNumber: addPropertyParams.phoneNumber,
    );

    final currentUser = AppProvider().getProfile();

    final propertyModel = PropertyModel(
      id: -1,
      contacts: contacts,
      arabicDescription: descriptionAR,
      englishDescription: descriptionENG,
      arabicAddress: addressAR,
      englishAddress: addressENG,
      price: addPropertyParams.price,
      area: addPropertyParams.area.toInt(),
      type: addPropertyParams.offerType,
      whatsappNumber: addPropertyParams.whatsapp,
      publisher: PublisherDetailsEntity(
        name: currentUser?.name,
        description: "Normal user",
        photoUrl: currentUser?.imageUrl,
      ),
      timeAddedProperty: DateTime.now(),
      latitude: addPropertyParams.lat!,
      longitude: addPropertyParams.lng!,
      imageNames: addPropertyParams.images!.map((e) => e.path).toList(),
      images: addPropertyParams.images!.map((e) => e.path).toList(),
    );

    final formData = FormData.fromMap(await propertyModel.toJson());

    await apiConsumer.post(
      endpoint: AppEndpoints.addProperty,
      formData: formData,
    );
  }

  @override
  Future<void> editProperty(PropertyEntity entity) async {
    final model = PropertyModel.fromEntity(entity);

    final formData = FormData.fromMap(await model.toJson()
      ..addAll(
        {"id": entity.id},
      ));

    await apiConsumer.put(
      endpoint: AppEndpoints.propertyById(
        entity.id.toString(),
        addPrefix: false,
      ),
      formData: formData,
    );
  }
}
