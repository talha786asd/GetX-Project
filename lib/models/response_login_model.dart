import 'dart:convert';

ResponseLoginModel responseLoginModelFromJson(String str) =>
    ResponseLoginModel.fromJson(jsonDecode(str));

class ResponseLoginModel {
  String? token;

  ResponseLoginModel({
    this.token,
  });

  factory ResponseLoginModel.fromJson(Map<String, dynamic> json) =>
      ResponseLoginModel(token: json['token']);
}
