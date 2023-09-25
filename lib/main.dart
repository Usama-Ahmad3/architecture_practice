import 'package:architecture_practice/app_navigation/app_navigation_layer.dart';
import 'package:architecture_practice/domain/user_repository/user_repository.dart';
import 'package:architecture_practice/network/network_repository.dart';
import 'package:architecture_practice/ui/user_detail/user_detail_cubit.dart';
import 'package:architecture_practice/ui/user_detail/user_detail_initial_param.dart';
import 'package:architecture_practice/ui/user_list/user_list_initial_params.dart';
import 'package:architecture_practice/ui/user_list/user_list_navigator.dart';
import 'package:architecture_practice/ui/user_list/user_list_qubit.dart';
import 'package:architecture_practice/data/rest_api_user_repository.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'ui/user_list/user_list_page.dart';

final getIt = GetIt.instance;
void main() {
  getIt.registerSingleton<NetworkRepository>(NetworkRepository());
  getIt.registerSingleton<UserRepository>(
      RestApiUserRepository(networkRepository: getIt()));
  getIt.registerSingleton<AppNavigation>(AppNavigation());
  getIt.registerSingleton<UserListNavigator>(
      UserListNavigator(navigation: getIt()));
  getIt.registerFactoryParam<UserListCubit, UserListInitialParams, dynamic>(
      (param, _) => UserListCubit(
          userListInitialParam: param,
          userRepository: getIt(),
          userListNavigator: getIt())
        ..fetchUser());
  getIt.registerFactoryParam<UserDetailCubit, UserDetailInitialParams, dynamic>(
      (param, param2) => UserDetailCubit(userDetailInitialParams: param));
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: UserListPage(cubit: getIt(param1: UserListInitialParams())),
    );
  }
}
