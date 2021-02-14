import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

class FeedDataProvider {
  Future getData() async {
    final response =
        await http.get("https://jsonplaceholder.typicode.com/posts");

    if (response.statusCode == 200) {
      final List<dynamic> postJson = json.decode(response.body);
      print("При запросе ошибки нет");
      log(postJson.toString());
      return postJson.map((json) => FeedModel.fromJson(json)).toList();
    } else {
      print("Ошибка при запросе");
      throw Exception('Error fetching users');
    }
  }
}

class FeedModel {
  int userId;
  int id;
  String title;
  String body;

  FeedModel({this.userId, this.id, this.title, this.body});

  factory FeedModel.fromJson(Map<String, dynamic> json) {
    return FeedModel(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['id'] = this.id;
    data['title'] = this.title;
    data['body'] = this.body;
    return data;
  }
}
