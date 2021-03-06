// Import the test package and Counter class
import 'package:flutter_testing/core/helpers/password_helper.dart';
import 'package:test/test.dart';

void main() {
  final String goodPassword = "Password1";
  group('Password must have 8 characters', () {
    test('Password with 8 character will be valid', () {
      final passwordHelper = PasswordsHelper();
      expect(passwordHelper.hasMinimumLength(goodPassword), true);
    });
    test('Password with less than 8 characters will not be valid', () {
      final passwordHelper = PasswordsHelper();
      expect(passwordHelper.hasMinimumLength("123"), false);
    });
  });

  group('Password must have at least 1 digit', () {
    test('Password with at least one digit will be valid', () {
      final passwordHelper = PasswordsHelper();
      expect(passwordHelper.hasDigits(goodPassword), true);
    });
    test('Password with no digits will not be valid', () {
      final passwordHelper = PasswordsHelper();
      expect(passwordHelper.hasDigits("abc"), false);
    });
  });

  group('Password must have at least 1 uppercase', () {
    test('Password with at least one uppercase will be valid', () {
      final passwordHelper = PasswordsHelper();
      expect(passwordHelper.hasDigits(goodPassword), true);
    });
    test('Password with no uppercase will not be valid', () {
      final passwordHelper = PasswordsHelper();
      expect(passwordHelper.hasMinimumLength("abc"), false);
    });
  });

  group('Password must fit all the rules', () {
    test(
        'Password with at least 8 chracters, 1 uppercase and 1 digit will be valid',
        () {
      final passwordHelper = PasswordsHelper();
      expect(passwordHelper.isValidPassword(goodPassword), true);
    });
    test('Password without 8 characters will not be valid', () {
      final passwordHelper = PasswordsHelper();
      expect(passwordHelper.isValidPassword("Oscar1"), false);
    });
    test('Password without 1 uppercase will not be valid', () {
      final passwordHelper = PasswordsHelper();
      expect(passwordHelper.isValidPassword("oscar1234"), false);
    });
    test('Password without 1 digit will not be valid', () {
      final passwordHelper = PasswordsHelper();
      expect(passwordHelper.isValidPassword("Oscarabc"), false);
    });
  });
}
