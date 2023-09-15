import 'dart:convert';

import 'package:architecture_practice/domain/respository/user_repository.dart';
import 'package:architecture_practice/data/models/user_json.dart';
import 'package:http/http.dart' as http;

import '../domain/entity/users.dart';

class RestApiUserRepository implements UserRepository {
  @override
  Future<List<Users>> getUsers() async {
    var url = Uri.parse('https://jsonplaceholder.typicode.com/users');
    var response = await http.get(url);
    var list = jsonDecode(response.body) as List;
    return list.map((e) => UserJson.fromJson(e).toDomain()).toList();
  }
}
