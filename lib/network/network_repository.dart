import 'dart:convert';

import 'package:dartz/dartz.dart';

import '../domain/entities/networkFailure.dart';
import 'package:http/http.dart' as http;

class NetworkRepository {
  Future<Either<NetworkFailure, dynamic>> get(String url) async {
    try {
      var response = await http.get(Uri.parse(url));
      return right(jsonDecode(response.body) as List);

      ///status code handling
      ///json parsing handle
    } catch (error) {
      return left(NetworkFailure(error: error.toString()));
    }
  }
}
