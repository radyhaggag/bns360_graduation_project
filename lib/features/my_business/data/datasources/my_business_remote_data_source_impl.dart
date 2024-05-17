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
    late String addressAR;
    late String addressENG;

    if (params.businessName.detectLanguage == Language.arabic) {
      titleAR = params.businessName;
      aboutAR = params.businessDescription;
      addressAR = params.businessAddress;
      final titleTranslation = await translator.translate(
        params.businessName,
      );
      final descriptionTranslation = await translator.translate(
        params.businessDescription,
      );
      final addressTranslation = await translator.translate(
        params.businessAddress,
      );
      titleENG = titleTranslation.text;
      aboutENG = descriptionTranslation.text;
      addressENG = addressTranslation.text;
    } else {
      titleENG = params.businessName;
      aboutENG = params.businessDescription;
      addressENG = params.businessAddress;
      final titleTranslation = await translator.translate(
        params.businessName,
      );
      final descriptionTranslation = await translator.translate(
        params.businessDescription,
      );
      final addressTranslation = await translator.translate(
        params.businessAddress,
      );
      titleAR = titleTranslation.text;
      aboutAR = descriptionTranslation.text;
      addressAR = addressTranslation.text;
    }

    final categoryItemModel = CategoryItemModel(
      id: -1,
      businessNameArabic: titleAR,
      businessNameEnglish: titleENG,
      businessDescriptionArabic: aboutAR,
      businessDescriptionEnglish: aboutENG,
      latitude: params.lat!,
      longitude: params.lng!,
      businessAddressArabic: addressAR,
      businessAddressEnglish: addressENG,

      contacts: ContactEntity(
        phoneNumber: params.phoneNumber,
      ),
      categoriesModel: CategoryModel.empty(), // will not added
      categoriesModelId: params.businessCategory!.id,
      closing: params.to,
      opening: params.from,
      holidays: params.holiday.id,
      profileImageName: params.mainBusinessImage,
      businessImageName1: params.mainBusinessBackgroundImages[0],
      businessImageName2: params.mainBusinessBackgroundImages[1],
      businessImageName3: params.mainBusinessBackgroundImages[2],
      businessImageName4: params.mainBusinessBackgroundImages[3],
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
  Future<void> deleteBusiness(int businessId) async {
    await apiConsumer.delete(
      endpoint: AppEndpoints.deleteBusiness(businessId),
    );
  }
}
