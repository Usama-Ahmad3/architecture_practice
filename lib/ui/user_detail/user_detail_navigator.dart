import 'package:architecture_practice/app_navigation/app_navigation_layer.dart';
import 'package:architecture_practice/main.dart';
import 'package:architecture_practice/ui/user_detail/user_detail_initial_param.dart';
import 'package:architecture_practice/ui/user_detail/user_detail_page.dart';
import 'package:flutter/material.dart';

class UserDetailNavigator {}

mixin UserDetailRoute {
  openUserDetail(UserDetailInitialParams userDetailInitialParams) {
    navigation.push(
        context, UserDetailPage(cubit: getIt(param1: userDetailInitialParams)));
  }

  BuildContext get context;
  AppNavigation get navigation;
}
