import 'dart:convert';
import 'package:getx_app/models/products_model.dart';
import 'package:getx_app/models/request_login_model.dart';
import 'package:getx_app/models/request_signup_model.dart';
import 'package:getx_app/models/response_login_model.dart';
import 'package:getx_app/models/response_signup_model.dart';
import 'package:http/http.dart' as http;

class RemoteServices {
  static Future<List<Product>?> getUsers() async {
    var response = await http.get(
      Uri.parse(
          'https://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline'),
    );

    return productFromJson(response.body);
  }

  static Future<ResponseSignupModel> postSignup(
      RequestSignupModel signupModel) async {
    var response = await http.post(
      Uri.parse('https://reqres.in/api/register'),
      body: jsonEncode(
        signupModel.toJson(),
      ),
      headers: {
        'Content-Type': 'appication/json',
      },
    );
    return responseSignupModelFromJson(response.body);
  }

  static Future<ResponseLoginModel> postLogin(
      RequestLoginModel loginModel) async {
    var response = await http.post(
      Uri.parse('https://reqres.in/api/register'),
      body: jsonEncode(loginModel.toJson()),
      headers: {
        'Content-Type': 'appication/json',
      },
    );
    return responseLoginModelFromJson(response.body);
  }
}
