import 'repository.dart';
import 'validations/rule.dart';
import 'validations/validator.dart';

mixin UpdateRepository<T, R> on Repository {
  Future<T> update(R request, [Map args]);
}

mixin UpdateUseCase<M, R> {
  Future<M> update(R request);
}

mixin UpdateUseCaseAdapter<M, R> implements UpdateUseCase<M, R> {
  Repository get repository;

  List<Rule<R>> get rules => [];

  @override
  Future<M> update(R request) {
    Validator.validate(request, rules, R.toString());
    return (repository as UpdateRepository).update(request);
  }
}
