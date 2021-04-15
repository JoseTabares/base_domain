import 'repository.dart';
import 'validations/rule.dart';
import 'validations/validator.dart';

mixin SaveInStorageRepository<T> on Repository {
  Future saveInStorage(T request, [Map args]);
}

mixin SaveInStorageUseCase<T> {
  Future saveInStorage(T request, [Map args]);
}

mixin SaveInStorageUseCaseAdapter<T> implements SaveInStorageUseCase<T> {
  Repository get repository;

  List<Rule<T>> get rules => [];

  @override
  Future saveInStorage(T request, [Map args]) {
    Validator.validate(request, rules, T.toString());
    return (repository as SaveInStorageRepository<T>)
        .saveInStorage(request, args);
  }
}
