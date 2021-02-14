import 'package:bot_nav_with_bloc/blocs/BottomNavCubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.pink,
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text(
          "Вторая страница",
          style: Theme.of(context).textTheme.headline3,
        ),
        RaisedButton(
          onPressed: () {
            context.read<BottomNavCubit>().getHome();
          },
          child: Text('Домой'),
        )
      ]),
    );
  }
}
