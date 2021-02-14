import 'package:bot_nav_with_bloc/blocs/HomeCubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ActionButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final HomeCubit homeCubit = context.read<HomeCubit>();
    return RaisedButton(
      child: Text('Загрузить'),
      onPressed: () {
        homeCubit.fetchFeed();
      },
      color: Colors.green,
    );
  }
}
