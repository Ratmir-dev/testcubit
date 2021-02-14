import 'package:bot_nav_with_bloc/services/FeedDataProvider.dart';
import 'package:bot_nav_with_bloc/services/HomeRepositories.dart';
import 'package:bot_nav_with_bloc/states/PostState.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<PostState> {
  final HomeRepositories homeRepositories;
  HomeCubit(this.homeRepositories) : super(PostEmptyState());

  Future<void> fetchFeed() async {
    try {
      emit(PostLoadingState());
      final List<FeedModel> _loadedPostList = await homeRepositories.getFeed();
      emit(PostLoadedState(loadedPost: _loadedPostList));
    } catch (e) {
      emit(PostErrorState());
    }
  }
}
