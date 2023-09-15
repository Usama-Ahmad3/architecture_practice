import 'package:flutter/cupertino.dart';
import '../domain/entity/users.dart';
import '../domain/respository/user_repository.dart';

class UserListProvider with ChangeNotifier {
  final UserRepository userRepository;
  UserListProvider({required this.userRepository});
  List<Users> _user = [];
  List<Users> get users => _user;
  Future<void> getUser() async {
    _user = await userRepository.getUsers();
    notifyListeners();
  }
}
