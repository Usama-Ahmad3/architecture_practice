import '../entity/users.dart';

abstract class UserRepository {
  Future<List<Users>> getUsers();
}
