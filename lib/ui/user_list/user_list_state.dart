import 'package:architecture_practice/domain/entities/user.dart';

class UserListState {
  final List<User> user;
  final bool isLoading;
  final String? error;
  UserListState({required this.user, required this.isLoading, this.error});
  factory UserListState.initial() => UserListState(user: [], isLoading: false);
  UserListState copyWith({List<User>? user, bool? isLoading, String? error}) =>
      UserListState(
          user: user ?? this.user,
          isLoading: isLoading ?? this.isLoading,
          error: error ?? this.error);
}
