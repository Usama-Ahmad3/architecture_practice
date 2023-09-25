import 'package:architecture_practice/ui/user_list/user_list_initial_params.dart';
import 'package:architecture_practice/ui/user_list/user_list_qubit.dart';
import 'package:architecture_practice/ui/user_list/user_list_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/user_card.dart';

class UserListPage extends StatefulWidget {
  UserListCubit cubit;
  UserListPage({super.key, required this.cubit});

  @override
  State<UserListPage> createState() => _UserListPageState();
}

class _UserListPageState extends State<UserListPage> {
  UserListInitialParams? userListInitialParams;
  @override
  void initState() {
    super.initState();
    widget.cubit.userListNavigator.context = context;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder(
        bloc: widget.cubit,
        builder: (BuildContext context, state) {
          final userState = state as UserListState;
          if (state.error != null) {
            return Center(child: Text(state.error!));
          }
          return Center(
            child: userState.isLoading
                ? const CircularProgressIndicator()
                : ListView(
                    children: userState.user
                        .map((user) => UserCard(
                              user: user,
                              onTap: () => widget.cubit.onTap(user),
                            ))
                        .toList(),
                  ),
          );
        },
      ),
    );
  }
}
