import 'dart:convert';

import 'package:my_getx_clean_architecture/domain/entities/auth/login.dart';
import 'package:my_getx_clean_architecture/domain/entities/auth/user.dart';

LoginModel LoginModelFromJson(String str) =>
    LoginModel.fromJson(json.decode(str));

String LoginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel extends Login {
  LoginModel({
    required String password,
    required String email,
  }) : super(password: password, email: email);

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        password: json["password"],
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "password": password,
        "email": email,
      };
}
