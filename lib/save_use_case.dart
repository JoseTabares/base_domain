import 'repository.dart';
import 'validations/rule.dart';
import 'validations/validator.dart';

mixin SaveRepository<T, R> on Repository {
  Future<T?> save(R? request, [Map? args]);
}

mixin SaveUseCase<T, R> {
  Future<T?> save(R? request, [Map? args]);
}

mixin SaveUseCaseAdapter<T, R> implements SaveUseCase<T, R> {
  Repository get repository;

  List<Rule<R>> get rules => [];

  @override
  Future<T?> save(R? request, [Map? args]) {
    Validator.validate(request, rules, R.toString());
    return (repository as SaveRepository<T, R>).save(request, args);
  }
}
