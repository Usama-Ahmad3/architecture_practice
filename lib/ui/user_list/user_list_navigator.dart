import 'package:architecture_practice/app_navigation/app_navigation_layer.dart';
import 'package:architecture_practice/main.dart';
import 'package:architecture_practice/ui/user_detail/user_detail_navigator.dart';
import 'package:architecture_practice/ui/user_list/user_list_initial_params.dart';
import 'package:architecture_practice/ui/user_list/user_list_page.dart';
import 'package:flutter/material.dart';

class UserListNavigator with UserDetailRoute {
  UserListNavigator({required this.navigation});
  @override
  late BuildContext context;

  @override
  final AppNavigation navigation;
}

mixin UserListRoute {
  openUserListRoute(UserListInitialParams userListInitialParams) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => UserListPage(
                  cubit: getIt(param1: userListInitialParams),
                )));
  }

  BuildContext get context;
}
