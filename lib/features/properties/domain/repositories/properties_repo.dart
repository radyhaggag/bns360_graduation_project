import '../../../../core/utils/custom_types.dart';
import '../entities/property_entity.dart';

abstract class PropertiesRepo {
  FutureEither<List<PropertyEntity>> getProperties();
  FutureEither<PropertyEntity> getPropertyById(String id);
  FutureEither<List<PropertyEntity>> searchOnProperties(String text);
}
