import 'package:base_models/errors/reason.dart';

import '../rule.dart';

Rule<T> customRule<T>(
  bool Function(T) mapper,
  String field,
  String message,
) {
  return Rule<T>(
    Reason(field, message),
    (object) => mapper(object),
  );
}

Rule<T> cannotBeEmpty<T>(
  String Function(T) mapper,
  String field,
  String message,
) {
  return Rule<T>(
    Reason(field, message),
    (object) => mapper(object)?.isNotEmpty ?? false,
  );
}

Rule<T> cannotBeNull<T>(
  dynamic Function(T) mapper,
  String field,
  String message,
) {
  return Rule<T>(
    Reason(field, message),
    (object) => mapper(object) != null,
  );
}
