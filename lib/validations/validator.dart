import 'package:base_models/errors/bad_request_error.dart';

import 'rule.dart';

class Validator {
  static void validate<T>(T object, List<Rule<T>> rules, String context) {
    var reasons = rules
        .where((rule) => rule.isInvalid(object))
        .map((rule) => rule.reason)
        .toList();

    if (reasons.isNotEmpty) {
      var code = '$context.error.badRequest';
      var description = '$context bad request';
      throw BadRequestError(code, description, reasons);
    }
  }
}
