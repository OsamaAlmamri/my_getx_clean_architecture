import 'package:get/get.dart';
import 'package:my_getx_clean_architecture/core/api/dio_consumer.dart';
import 'package:my_getx_clean_architecture/core/api/end_points.dart';
import 'package:my_getx_clean_architecture/data/models/login_model.dart';
import 'package:my_getx_clean_architecture/data/models/user_model.dart';
import 'package:my_getx_clean_architecture/domain/entities/auth/login.dart';
abstract class LoginRemoteDataSource {
  Future<UserModel> login(LoginModel login);
}

class LoginRemoteDataSourceImpl implements LoginRemoteDataSource {
  DioConsumer apiConsumer=Get.find();
  @override
  Future<UserModel> login( LoginModel login) async {
    final response = await apiConsumer.post(
      EndPoints.login,
      body:  (login.toJson())
    );
    return UserModel.fromJson(response);
  }
}
