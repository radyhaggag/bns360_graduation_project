import '../../../../../core/shared_data/entities/property_entity.dart';
import '../../../../../core/shared_data/models/property_model.dart';
import '../../../params/add_property_params.dart';

abstract class PropertiesRemoteDataSource {
  Future<List<PropertyModel>> getProperties();
  Future<PropertyModel> getPropertyById(String id);
  Future<void> addProperty(AddPropertyParams addPropertyParams);
  Future<void> editProperty(PropertyEntity entity);
}
