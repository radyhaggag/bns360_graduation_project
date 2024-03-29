import 'package:bns360_graduation_project/core/utils/extensions/validators.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('FormValidatorExtension', () {
    test('isEmail Should return true when provide valid email format', () {
      // Arrange
      const validEmail = "radyhaggag11@gmail.com";
      // Arrange
      final result = validEmail.isEmail();
      // Assert
      expect(result, isTrue);
    });
    test('isEmail Should return false when provide Invalid email format', () {
      // Arrange
      const invalidEmail = "radyhaggag11@gmail";
      // Act
      final result = invalidEmail.isEmail();
      // Assert
      expect(result, isFalse);
    });
    test('Should return true when provide valid Phone Number format', () {
      // Arrange
      const validPhone = "+201030096242";
      // Act
      final result = validPhone.isPhone();
      // Assert
      expect(result, isTrue);
    });

    test('Should return false when provide Invalid Phone Number format', () {
      // Arrange
      const invalidPhone = "+201630096242";
      // Act
      final result = invalidPhone.isPhone();
      // Assert
      expect(result, isFalse);
    });
  });
}
