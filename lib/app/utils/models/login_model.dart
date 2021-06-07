// To parse this JSON data, do
//
//     final loginModel = loginModelFromMap(jsonString);

import 'dart:convert';

class LoginModel {
  String name;
  String password;

  LoginModel({this.name, this.password});

  LoginModel.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        password = json['password'];

  Map<String, dynamic> toJson() => {
    'name': name,
    'password': password,
  };

}
