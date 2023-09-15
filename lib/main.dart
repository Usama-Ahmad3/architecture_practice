import 'package:architecture_practice/ui/user_list_page.dart';
import 'package:architecture_practice/ui/user_list_provider.dart';
import 'package:architecture_practice/data/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

import 'domain/respository/user_repository.dart';

GetIt getIt = GetIt.instance;
void main() {
  getIt.registerLazySingleton<UserRepository>(() => RestApiUserRepository());
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_) => UserListProvider(userRepository: getIt())..getUser())
      ],
      child: const MyApp(),
    ),
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
      home: const UserListPage(),
    );
  }
}
