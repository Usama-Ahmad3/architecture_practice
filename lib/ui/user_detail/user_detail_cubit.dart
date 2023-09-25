import 'package:architecture_practice/ui/user_detail/user_detail_initial_param.dart';
import 'package:architecture_practice/ui/user_detail/user_detail_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserDetailCubit extends Cubit<UserDetailState> {
  final UserDetailInitialParams userDetailInitialParams;
  UserDetailCubit({required this.userDetailInitialParams})
      : super(UserDetailState.initial(
            userDetailInitialParams: userDetailInitialParams));
}
