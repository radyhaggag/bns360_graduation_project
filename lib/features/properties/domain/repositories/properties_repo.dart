import '../../../../core/shared_data/entities/property_entity.dart';
import '../../../../core/utils/custom_types.dart';
import '../../params/add_property_params.dart';

abstract class PropertiesRepo {
  FutureEither<List<PropertyEntity>> getProperties();
  FutureEither<void> addProperty(AddPropertyParams addPropertyParams);
  FutureEither<void> editProperty(PropertyEntity entity);
}
