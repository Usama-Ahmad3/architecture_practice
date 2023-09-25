import 'package:equatable/equatable.dart';

class User extends Equatable {
  final int id;
  final String name;
  final String email;
  final String userName;
  final String website;
  final String phone;

  const User(
      {required this.id,
      required this.name,
      required this.email,
      required this.userName,
      required this.website,
      required this.phone});

  const User.empty()
      : id = 000,
        userName = '',
        website = '',
        phone = '',
        name = '',
        email = '';

  @override
  List<Object?> get props => [
        User(
            id: id,
            name: name,
            email: email,
            userName: userName,
            website: website,
            phone: phone)
      ];
}
