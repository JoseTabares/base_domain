import 'package:base_models/errors/reason.dart';

class Rule<T> {
  final Reason reason;
  final bool Function(T) isValid;

  Rule(
    this.reason,
    this.isValid,
  );

  bool isInvalid(T object) {
    var result = !isValid(object);
    return result;
  }
}
