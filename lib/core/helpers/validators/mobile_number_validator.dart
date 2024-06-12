import 'package:reactive_forms/reactive_forms.dart';

import '../../utils/extensions/validators.dart';

class MobileNumberValidator extends Validator<dynamic> {
  const MobileNumberValidator() : super();

  @override
  Map<String, dynamic>? validate(AbstractControl<dynamic> control) {
    final phoneValue = "+20${control.value}";
    final isPhone = phoneValue.isPhone();
    return isPhone
    ? null
    : {'requiredTrue': true};
  }
}
