import 'repository.dart';

mixin DeleteByIdRepository<T> on Repository {
  Future<T?> delete(String? id, [Map? args]);
}

mixin DeleteByIdUseCase<T> {
  Future<T?> delete(String? id, [Map<String, dynamic>? params]);
}

mixin DeleteByIdUseCaseAdapter<T> implements DeleteByIdUseCase<T> {
  Repository get repository;

  @override
  Future<T?> delete(String? id, [Map<String, dynamic>? params]) {
    return (repository as DeleteByIdRepository)
        .delete(id, params)
        .then((value) => value as T);
  }
}
