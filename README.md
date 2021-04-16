Library for manage manage general use cases.

## Using

For use use cases

```dart

import 'package:base_domain/base_domain.dart';

mixin UsersRepository on GetAllRepository<User> {}

mixin UsersUseCase on GetAllUseCase<User>, SaveUseCase<User, User> {}

class UsersUseCaseAdapter
    with GetAllUseCaseAdapter<User>, SaveUseCaseAdapter<User, User>
    implements UsersUseCase {
  final UsersRepository repository;

  UsersUseCaseAdapter(this.repository);

  @override
  List<Rule<User>> get rules => [
        cannotBeNull((user) => user.name, 'name', 'Name can not be null'),
        cannotBeNull((user) => user.lastname, 'lastname', 'Lastname can not be null'),
      ];
}

```