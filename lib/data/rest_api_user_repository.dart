import 'package:architecture_practice/domain/entities/user.dart';
import 'package:architecture_practice/data/user_json.dart';
import 'package:architecture_practice/domain/user_repository/user_repository.dart';
import 'package:architecture_practice/network/network_repository.dart';
import 'package:dartz/dartz.dart';

import '../domain/entities/user_list_failure.dart';

class RestApiUserRepository implements UserRepository {
  final NetworkRepository networkRepository;
  RestApiUserRepository({required this.networkRepository});
  @override
  Future<Either<UserListFailure, List<User>>> getUser() async {
    return networkRepository
        .get('https://jsonplaceholder.typicode.com/users')
        .then((value) => value.fold((l) {
              return left(UserListFailure(error: l.error));
            }, (r) {
              var list = r as List;
              return right(
                  list.map((e) => UserJson.fromJson(e).toDomain()).toList());
            }));

    ///status code handling
    ///json parsing handle
  }
}
