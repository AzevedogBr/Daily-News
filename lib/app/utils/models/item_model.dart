// To parse this JSON data, do
//
//     final itemModel = itemModelFromJson(jsonString);

import 'dart:convert';

import 'package:mobx/mobx.dart';

ItemModel itemModelFromJson(String str) => ItemModel.fromJson(json.decode(str));

String itemModelToJson(ItemModel data) => json.encode(data.toJson());

class ItemModel {
  ItemModel({
    this.by,
    this.id,
    this.kids,
    this.parent,
    this.text,
    this.time,
    this.type,
    this.title,
    this.favorite = false,
  });

  String by;
  int id;
  List<int> kids;
  int parent;
  String text;
  int time;
  String type;
  String title;
  @observable
  bool favorite;

  factory ItemModel.fromJson(Map<String, dynamic> json) => ItemModel(
    by: json["by"] == null ? "" : json["by"],
    id: json["id"],
    kids: json["kids"] == null ? [] : List<int>.from(json["kids"].map((x) => x)),
    parent: json["parent"],
    text: json["text"],
    time: json["time"] ?? 0,
    type: json["type"] ?? "",
    title: json["title"],
    favorite: json["favorite"] ?? false
  );

  Map<String, dynamic> toJson() => {
    "by": by,
    "id": id,
    "kids": List<dynamic>.from(kids.map((x) => x)),
    "parent": parent,
    "text": text,
    "time": time,
    "type": type,
  };

  static Map<String, dynamic> toMap(ItemModel item) => {
    "by": item.by,
    "id": item.id,
    "kids": List<dynamic>.from(item.kids.map((x) => x)),
    "parent": item.parent,
    "text": item.text,
    "time": item.time,
    "type": item.type,
    "title": item.title,
    "favorite": item.favorite
  };

  static String encode(List<ItemModel> items) => json.encode(
    items
        .map<Map<String, dynamic>>((item) => ItemModel.toMap(item))
        .toList(),
  );

  static List<ItemModel> decode(String items) =>
      (json.decode(items) as List<dynamic>)
          .map<ItemModel>((item) => ItemModel.fromJson(item))
          .toList();
}