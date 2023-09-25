import 'package:architecture_practice/ui/user_detail/user_detail_initial_param.dart';

import '../../domain/entities/user.dart';

class UserDetailState {
  final User user;
  UserDetailState({required this.user});
  factory UserDetailState.initial(
          {required UserDetailInitialParams userDetailInitialParams}) =>
      UserDetailState(user: userDetailInitialParams.user);
  UserDetailState copyWith({User? user}) =>
      UserDetailState(user: user ?? this.user);
}
