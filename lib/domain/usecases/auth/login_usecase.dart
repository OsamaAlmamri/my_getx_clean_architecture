import 'package:dartz/dartz.dart';
import 'package:my_getx_clean_architecture/core/usecases/usecase.dart';
import 'package:my_getx_clean_architecture/data/models/login_model.dart';
import 'package:my_getx_clean_architecture/data/repositories/login_repository_impl.dart';
import 'package:my_getx_clean_architecture/domain/entities/auth/login.dart';
import 'package:my_getx_clean_architecture/domain/entities/auth/user.dart';

import '../../../../core/error/failures.dart';

class LoginUseCase implements UseCase<User, LoginModel> {
  @override
  final LoginRepositoryImpl loginRepositoryImpl;

  LoginUseCase({required this.loginRepositoryImpl});

  Future<Either<Failure, User>> call(LoginModel login) =>
      loginRepositoryImpl.login(login);
}
