import 'package:architecture_practice/domain/entities/user.dart';
import 'package:architecture_practice/domain/user_repository/user_repository.dart';
import 'package:dartz/dartz.dart';

import '../domain/entities/user_list_failure.dart';

class MockUserRepository implements UserRepository {
  @override
  Future<Either<UserListFailure, List<User>>> getUser() async => right([
        const User(
            id: 123,
            name: 'name',
            email: 'email',
            userName: 'userName',
            website: 'website',
            phone: 'phone')
      ]);
}
