import 'package:flutter/material.dart';

import '../../domain/entity/users.dart';

class UserCard extends StatelessWidget {
  final Users user;
  const UserCard({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      padding: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
          color: Colors.grey.shade200, borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        title: Text(user.name),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [Text(user.email), Text(user.phone), Text(user.website)],
        ),
        leading: CircleAvatar(
          child: Text(user.name[0]),
        ),
      ),
    );
  }
}
