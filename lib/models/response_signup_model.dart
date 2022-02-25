import 'dart:convert';

ResponseSignupModel responseSignupModelFromJson(String str) =>
    ResponseSignupModel.fromJson(jsonDecode(str));

class ResponseSignupModel {
  int? id;
  String? token;

  ResponseSignupModel({
    this.id,
    this.token,
  });

  factory ResponseSignupModel.fromJson(Map<String, dynamic> json) =>
      ResponseSignupModel(
        id: json['id'],
        token: json['token'],
      );
}
