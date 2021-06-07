// To parse this JSON data, do
//
//     final loginModel = loginModelFromMap(jsonString);

import 'dart:convert';

class UserModel {
  String name;
  String password;
  String email;

  UserModel({this.name, this.password, this.email});

  UserModel.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        password = json['password'],
        email = json['email'];

  Map<String, dynamic> toJson() => {
    'name': name,
    'password': password,
    'email': email,
  };

}
