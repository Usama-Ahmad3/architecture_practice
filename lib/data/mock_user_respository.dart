import 'package:architecture_practice/domain/respository/user_repository.dart';
import 'package:architecture_practice/data/models/user_json.dart';

import '../domain/entity/users.dart';

class MockUserRepository implements UserRepository {
  @override
  Future<List<Users>> getUsers() async => [
        UserJson(
                id: 123,
                name: 'name',
                email: 'email',
                userName: 'userName',
                website: 'website',
                phone: 'phone')
            .toDomain()
      ];
}
