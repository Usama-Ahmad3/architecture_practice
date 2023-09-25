import 'package:architecture_practice/domain/entities/user.dart';
import 'package:architecture_practice/domain/user_repository/user_repository.dart';
import 'package:architecture_practice/ui/user_detail/user_detail_initial_param.dart';
import 'package:architecture_practice/ui/user_list/user_list_initial_params.dart';
import 'package:architecture_practice/ui/user_list/user_list_navigator.dart';
import 'package:architecture_practice/ui/user_list/user_list_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserListCubit extends Cubit<UserListState> {
  final UserRepository userRepository;
  final UserListNavigator userListNavigator;
  final UserListInitialParams userListInitialParam;
  UserListCubit(
      {required this.userRepository,
      required this.userListInitialParam,
      required this.userListNavigator})
      : super(UserListState.initial());
  Future<void> fetchUser() async {
    emit(state.copyWith(isLoading: true, error: null));
    final user = await userRepository.getUser();
    user.fold((errorLeft) {
      ///show dialog box
      ///after add navigation layer
      emit(state.copyWith(error: errorLeft.error));
    }, (right) {
      return emit(state.copyWith(user: right, isLoading: false));
    });
  }

  onTap(User user) {
    userListNavigator.openUserDetail(UserDetailInitialParams(user: user));
  }
}
