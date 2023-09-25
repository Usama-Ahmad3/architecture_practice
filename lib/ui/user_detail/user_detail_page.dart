import 'package:architecture_practice/ui/user_detail/user_detail_cubit.dart';
import 'package:architecture_practice/ui/user_detail/user_detail_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserDetailPage extends StatefulWidget {
  final UserDetailCubit cubit;
  const UserDetailPage({super.key, required this.cubit});

  @override
  State<UserDetailPage> createState() => _UserDetailPageState();
}

class _UserDetailPageState extends State<UserDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder(
          bloc: widget.cubit,
          builder: (context, state) {
            state as UserDetailState;
            return Center(
              child: ListTile(
                title: Text(state.user.name),
                subtitle: Text(state.user.email),
              ),
            );
          }),
    );
  }
}
