import '../../../../core/shared_data/entities/property_entity.dart';
import '../../../../core/utils/custom_types.dart';
import '../../params/add_property_params.dart';

abstract class PropertiesRepo {
  FutureEither<List<PropertyEntity>> getProperties();
  FutureEither<PropertyEntity> getPropertyById(String id);
  FutureEither<List<PropertyEntity>> searchOnProperties(String text);
  FutureEither<void> addProperty(AddPropertyParams addPropertyParams);
  FutureEither<void> editProperty(AddPropertyParams addPropertyParams);
}
