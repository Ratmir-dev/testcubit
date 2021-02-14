import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeCubit extends Cubit<ThemeData>{
  final _colors = [Colors.green, Colors.pink, Colors.red, Colors.amber];

  ThemeCubit() : super(ThemeData(
    primarySwatch: Colors.green,
    visualDensity: VisualDensity.adaptivePlatformDensity,
  ),);

  void updateColor(){
    emit(ThemeData(
      primarySwatch: _colors[Random().nextInt(3)],
      visualDensity: VisualDensity.adaptivePlatformDensity,
    ),);
  }
}