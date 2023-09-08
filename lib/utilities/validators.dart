import 'package:regexed_validator/regexed_validator.dart';

class Validators {

  static bool checkValidateUrl(String value) {
    return validator.url(value);
  }
  static bool checkValidateEmail(String value) {
    return validator.email(value);
  }

}