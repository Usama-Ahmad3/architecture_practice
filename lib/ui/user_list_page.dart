import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'user_list_provider.dart';
import 'widgets/user_card.dart';

class UserListPage extends StatefulWidget {
  const UserListPage({super.key});

  @override
  State<UserListPage> createState() => _UserListPageState();
}

class _UserListPageState extends State<UserListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: ListView(
          children: context
              .watch<UserListProvider>()
              .users
              .map((e) => UserCard(
                    user: e,
                  ))
              .toList(),
        ),
      ),
    );
  }
}
