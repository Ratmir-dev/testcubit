import 'package:flutter/cupertino.dart';

abstract class PostState {}

class PostEmptyState extends PostState {}

class PostLoadingState extends PostState {}

class PostLoadedState extends PostState {
  List<dynamic> loadedPost;
  PostLoadedState({@required this.loadedPost}) : assert(loadedPost != null);
}

class PostErrorState extends PostState {}
