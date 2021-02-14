import 'package:bot_nav_with_bloc/blocs/HomeCubit.dart';
import 'package:bot_nav_with_bloc/states/PostState.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeedList extends StatefulWidget {
  @override
  _FeedListState createState() => _FeedListState();
}

class _FeedListState extends State<FeedList> {
  final _scrollController = ScrollController();
  final _scrollThreshold = 200.0;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      final maxScroll = _scrollController.position.maxScrollExtent;
      final currentScroll = _scrollController.position.pixels;
      if (maxScroll - currentScroll <= _scrollThreshold) {
        context.read<HomeCubit>().fetchFeed();
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, PostState>(
      builder: (BuildContext context, state) {
        if (state is PostEmptyState) {
          return Center(
            child: Text("Нет данных. Нажмите загрузить"),
          );
        }
        if (state is PostLoadingState) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is PostLoadedState) {
          return GridView.count(
            controller: _scrollController,
            crossAxisCount: 2,
            childAspectRatio: 0.80,
            children: List.generate(state.loadedPost.length, (index) {
              return Container(
                color: Colors.white54,
                child: Center(child: Text(state.loadedPost[index].title)),
              );
            }),
          );
        }
        if (state is PostErrorState) {
          return Center(
            child: Text("Ошибка получения данных"),
          );
        }
        return SizedBox();
      },
    );
  }
}
