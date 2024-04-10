import '../../../params/add_property_params.dart';
import '../../models/property_model.dart';

abstract class PropertiesRemoteDataSource {
  Future<List<PropertyModel>> getProperties();
  Future<PropertyModel> getPropertyById(String id);
  Future<List<PropertyModel>> searchOnProperties(String text);
  Future<void> addProperty(AddPropertyParams addPropertyParams);
}
