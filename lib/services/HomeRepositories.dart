import 'package:bot_nav_with_bloc/services/FeedDataProvider.dart';

class HomeRepositories {
  FeedDataProvider _feedDataProvider = FeedDataProvider();

  Future<dynamic> getFeed() {
    return _feedDataProvider.getData();
  }
}
