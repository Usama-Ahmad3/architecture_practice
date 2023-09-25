import 'package:dartz/dartz.dart';

import '../entities/user.dart';
import '../entities/user_list_failure.dart';

abstract class UserRepository{
  Future<Either<UserListFailure,List<User>>> getUser();
}