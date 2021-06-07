// To parse this JSON data, do
//
//     final dailyNews = dailyNewsFromJson(jsonString);

import 'dart:convert';

import 'package:intl/intl.dart';

DailyNewsModel dailyNewsFromJson(String str) => DailyNewsModel.fromJson(json.decode(str));

String dailyNewsToJson(DailyNewsModel data) => json.encode(data.toJson());

class DailyNewsModel {
  DailyNewsModel({
    this.news,
  });

  List<News> news;

  factory DailyNewsModel.fromJson(Map<String, dynamic> json) => DailyNewsModel(
    news: List<News>.from(json["news"].map((x) => News.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "news": List<dynamic>.from(news.map((x) => x.toJson())),
  };

}

class News {
  News({
    this.user,
    this.message,
    this.favorite
  });

  User user;
  Message message;
  bool favorite;

  factory News.fromJson(Map<String, dynamic> json) => News(
    user: User.fromJson(json["user"]),
    message: Message.fromJson(json["message"]),
    favorite: json['favorite'] ?? false,
  );

  Map<String, dynamic> toJson() => {
    "user": user.toJson(),
    "message": message.toJson(),
    "favorite": favorite,
  };
}

class Message {
  Message({
    this.content,
    this.createdAt,
  });

  String content;
  DateTime createdAt;

  factory Message.fromJson(Map<String, dynamic> json) => Message(
    content: json["content"],
    createdAt: DateTime.parse(json["created_at"]),
  );

  Map<String, dynamic> toJson() => {
    "content": content,
    "created_at": createdAt.toIso8601String(),
  };


  String get dateBR => (createdAt != null) ? DateFormat('dd/MM/yyyy H:m').format(createdAt) : null;
}

class User {
  User({
    this.name,
    this.profilePicture,
  });

  String name;
  String profilePicture;

  factory User.fromJson(Map<String, dynamic> json) => User(
    name: json["name"],
    profilePicture: json["profile_picture"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "profile_picture": profilePicture,
  };
}
