import 'package:get/get.dart';
import 'package:my_getx_clean_architecture/core/error/exceptions.dart';
import 'package:my_getx_clean_architecture/core/network/netwok_info.dart';
import 'package:my_getx_clean_architecture/data/datasources/login_remote_data_source.dart';
import 'package:my_getx_clean_architecture/data/models/login_model.dart';
import 'package:my_getx_clean_architecture/domain/entities/auth/user.dart';
import 'package:my_getx_clean_architecture/domain/repositories/auth/login_repository.dart';
import 'package:my_getx_clean_architecture/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginRepositoryImpl implements LoginRepository {
  final NetworkInfoImpl networkInfo = Get.find();
  // final SharedPreferences sharedPreferences = Get.find();
  final LoginRemoteDataSourceImpl loginRemoteDataSourceImpl = Get.find();

  @override
  Future<Either<Failure, User>> login(LoginModel loginData) async {
    // if (await networkInfo.isConnected) {
    try {
      final user = await loginRemoteDataSourceImpl.login(loginData);
      // sharedPreferences.setString(AppString.token, user.token);
      // sharedPreferences.setString('userData', UserModelToJson(user));
      return Right(user);
    } on ServerException {
      return Left(ServerFailure(ServerException));
    } catch (err) {
      print("errrrrrrr");
      print(err);
      return Left(ServerFailure(err));
    }
    // } else {
    //
    // }
  }
}
