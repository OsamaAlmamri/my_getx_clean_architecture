
import 'dart:convert';

import 'package:my_getx_clean_architecture/domain/entities/auth/user.dart';

UserModel UserModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String UserModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel extends User {
  UserModel({
    required int id,
    required String name,
    required String email,
    String? phone,
    String? phoneId,
    String? avatar,
    required String token,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) : super(
            id: id,
            name: name,
            email: email,
            phone: phone,
            phoneId: phoneId,
            avatar: avatar,
            token: token,
            createdAt: createdAt,
            updatedAt: updatedAt);

  factory UserModel.fromJson(Map<String, dynamic> json) {
  return  UserModel(
      id: json["data"]["id"],
      name: json["data"]["name"],
      email: json["data"]["email"],
      phone: json["data"]["phone"],
      phoneId: json["data"]["phone_id"],
      avatar: json["data"]["avatar"],
      token: json["data"]["token"],
      createdAt: DateTime.parse(json["data"]["created_at"]),
      updatedAt: DateTime.parse(json["data"]["updated_at"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "phone": phone,
        "phone_id": phoneId,
        "avatar": avatar,
        "token": token,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
