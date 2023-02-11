import 'package:equatable/equatable.dart';

class User extends Equatable {
  int id;
  String name;
  String email;
  String? phone;
  String? phoneId;
  String? avatar;
  String token;
  DateTime? createdAt;
  DateTime? updatedAt;
  User({
    required  this.id,
    required this.name,
    required this.email,
    this.phone,
    this.phoneId,
    this.avatar,
    required this.token,
    this.createdAt,
    this.updatedAt,
  });


  @override
  List<Object?> get props => [id,name,email, phone,phoneId,token,createdAt,updatedAt];
}
