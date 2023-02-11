import 'package:dartz/dartz.dart';
import 'package:my_getx_clean_architecture/data/models/login_model.dart';
import 'package:my_getx_clean_architecture/domain/entities/auth/user.dart';
import '../../../../core/error/failures.dart';

abstract class LoginRepository {
  Future<Either<Failure, User>> login(LoginModel login);
}
