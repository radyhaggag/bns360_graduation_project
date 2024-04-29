import 'package:bns360_graduation_project/core/api/api_consumer.dart';
import 'package:bns360_graduation_project/core/shared_data/entities/category_item_entity.dart';
import 'package:bns360_graduation_project/core/shared_data/entities/contact_entity.dart';
import 'package:bns360_graduation_project/core/shared_data/models/category_item_model.dart';
import 'package:bns360_graduation_project/core/shared_data/models/category_model.dart';
import 'package:bns360_graduation_project/core/utils/app_endpoints.dart';
import 'package:bns360_graduation_project/core/utils/enums.dart';
import 'package:bns360_graduation_project/core/utils/extensions/language.dart';
import 'package:bns360_graduation_project/features/my_business/domain/params/add_business_params.dart';
import 'package:translator/translator.dart';

import '../../../../core/helpers/load_json_from_asset.dart';
import 'my_business_remote_data_source.dart';

class MyBusinessRemoteDataSourceImpl implements MyBusinessRemoteDataSource {
  final APIConsumer apiConsumer;

  MyBusinessRemoteDataSourceImpl({
    required this.apiConsumer,
  });

  @override
  Future<void> addBusiness(AddBusinessParams params) async {
    final translator = GoogleTranslator();
    late String titleAR;
    late String titleENG;
    late String aboutAR;
    late String aboutENG;

    if (params.businessName.detectLanguage == Language.arabic) {
      titleAR = params.businessName;
      final titleTranslation = await translator.translate(
        params.businessName,
      );
      titleENG = titleTranslation.text;
      aboutAR = params.businessDescription;
      final translation = await translator.translate(
        params.businessDescription,
      );
      aboutENG = translation.text;
    }

    CategoryItemModel categoryItemModel = CategoryItemModel.empty();
    categoryItemModel = categoryItemModel.copyWith(
      nameAR: titleAR,
      nameENG: titleENG,
      aboutAR: aboutAR,
      aboutENG: aboutENG,
      latitude: params.lat,
      longitude: params.lng,
      address: params.businessAddress,
      contacts: ContactEntity(
        emails: const [],
        phoneNumbers: [params.phoneNumber],
        urlSites: const [],
      ),
    );

    await apiConsumer.post(
      endpoint: AppEndpoints.addBusiness,
      data: categoryItemModel.toJson(),
    );
  }

  @override
  Future<List<CategoryModel>> getBusinessCategories() async {
    final res = await apiConsumer.get(
      endpoint: AppEndpoints.getAllCategories,
    );
    final categories = List<CategoryModel>.from(res.data.map(
      (category) => CategoryModel.fromJson(category),
    ));
    return categories;
  }

  @override
  Future<List<CategoryItemModel>> getMyBusiness() async {
    final res = await loadJsonFromAsset('categories_items.json');
    final items = List<CategoryItemModel>.from(res['data'].map(
      (item) => CategoryItemModel.fromJson(item),
    ));
    return items;
  }

  @override
  Future<void> updateBusiness(CategoryItemEntity params) async {
    final model = CategoryItemModel.fromEntity(params);
    await apiConsumer.put(
      endpoint: AppEndpoints.updateBusiness(params.id),
      data: model.toJson(),
    );
  }

  @override
  Future<void> deleteBusiness(String businessId) async {
    await apiConsumer.delete(
      endpoint: AppEndpoints.deleteBusiness(businessId),
    );
  }
}
