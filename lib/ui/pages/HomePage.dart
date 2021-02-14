import 'package:bot_nav_with_bloc/blocs/HomeCubit.dart';
import 'package:bot_nav_with_bloc/services/HomeRepositories.dart';
import 'package:bot_nav_with_bloc/widgets/ActionButtons.dart';
import 'package:bot_nav_with_bloc/widgets/FeedList.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  final HomeRepositories _homeRepositories = HomeRepositories();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => HomeCubit(_homeRepositories),
      child: Column(children: [
        SafeArea(child: ActionButtons()),
        Expanded(child: FeedList()),
      ]),
    );
  }
}
