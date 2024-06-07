import 'package:dio/dio.dart';
import 'package:translator/translator.dart';

import '../../../../core/api/api_consumer.dart';
import '../../../../core/providers/app_provider.dart';
import '../../../../core/shared_data/entities/category_item_entity.dart';
import '../../../../core/shared_data/entities/contact_entity.dart';
import '../../../../core/shared_data/models/category_item_model.dart';
import '../../../../core/shared_data/models/category_model.dart';
import '../../../../core/shared_data/models/review_summary_model.dart';
import '../../../../core/utils/app_endpoints.dart';
import '../../../../core/utils/enums.dart';
import '../../../../core/utils/extensions/language.dart';
import '../../domain/params/add_business_params.dart';
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
        from: "ar",
        to: "en",
      );
      final descriptionTranslation = await translator.translate(
        params.businessDescription,
        from: "ar",
        to: "en",
      );
      final addressTranslation = await translator.translate(
        params.businessAddress,
        from: "ar",
        to: "en",
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
        from: "en",
        to: "ar",
      );
      final descriptionTranslation = await translator.translate(
        params.businessDescription,
        from: "en",
        to: "ar",
      );
      final addressTranslation = await translator.translate(
        params.businessAddress,
        from: "en",
        to: "ar",
      );
      titleAR = titleTranslation.text;
      aboutAR = descriptionTranslation.text;
      addressAR = addressTranslation.text;
    }

    final userId = AppProvider().getProfile()!.id;

    final categoryItemModel = CategoryItemModel(
      userId: userId,
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

    final FormData formData = FormData.fromMap(
      await categoryItemModel.toJson(),
    );

    await apiConsumer.post(
      endpoint: AppEndpoints.addBusiness,
      formData: formData,
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
    final userId = AppProvider().getProfile()!.id;
    final res = await apiConsumer.get(
      endpoint: AppEndpoints.getMyBusiness(userId),
    );
    if (res.data == null) return [];
    final category = (res.data as List)
        .map<Future<CategoryItemModel>>(
            (json) => _mapAndGetCategoryItemModel(json))
        .toList();

    final result = await Future.wait<CategoryItemModel>(category);
    return result;
  }

  Future<CategoryItemModel> _mapAndGetCategoryItemModel(
    Map<String, dynamic> json,
  ) async {
    CategoryItemModel model = CategoryItemModel.fromJson(json);

    final res = await apiConsumer.get(
      endpoint: AppEndpoints.getBusinessReviewSummary(model.id),
    );
    final reviewSummary = ReviewSummaryModel.fromJson(res.data);
    model = CategoryItemModel.fromEntity(
      model.copyWith(reviewSummary: reviewSummary),
    );
    return model;
  }

  @override
  Future<void> updateBusiness(CategoryItemEntity params) async {
    final model = CategoryItemModel.fromEntity(params);

    final FormData formData = FormData.fromMap(
      await model.toJson(),
    );

    await apiConsumer.put(
      endpoint: AppEndpoints.updateBusiness(params.id),
      formData: formData,
    );
  }

  @override
  Future<void> deleteBusiness(int businessId) async {
    await apiConsumer.delete(
      endpoint: AppEndpoints.deleteBusiness(businessId),
    );
  }
}
