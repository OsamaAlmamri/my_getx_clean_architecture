import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_getx_clean_architecture/core/api/handingdatacontroller.dart';
import 'package:my_getx_clean_architecture/core/error/failures.dart';
import 'package:my_getx_clean_architecture/core/utils/app_strings.dart';
import 'package:my_getx_clean_architecture/core/widgets/statusrequest.dart';
import 'package:my_getx_clean_architecture/data/models/login_model.dart';
import 'package:my_getx_clean_architecture/domain/entities/auth/user.dart';
import 'package:my_getx_clean_architecture/domain/usecases/auth/login_usecase.dart';

class LoginController extends GetxController {
  StatusRequest statusRequest = StatusRequest.none;
  final LoginUseCase loginUseCase;
  late User user;

  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  late TextEditingController email;
  late TextEditingController password;
  bool isshowpassword = true;

  LoginController({required this.loginUseCase});

  goToForgetPassword() {
    // Get.toNamed(AppRoute.forgetPassword);
  }

  goToSignUp() {
    // Get.offNamed(AppRoute.signUp);
  }

  showPassword() {
    isshowpassword = isshowpassword == true ? false : true;
    update();
  }

  Future<void> loginWithEmail() async {
    // statusRequest = StatusRequest.loading;
    // update();
    Either<Failure, User> response = await loginUseCase(
        LoginModel(password: password.text, email: email.text));
    var res = response.fold((failure) {
      Get.defaultDialog(
          title: "ُWarning", middleText: "Email Or Password Not Correct");
      statusRequest = StatusRequest.failure;
    }, (q) {
      user = q;
      statusRequest = StatusRequest.success;
    });
    update();
  }

  String _mapFailureToMsg(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        {
          statusRequest = StatusRequest.serverfailure;
          return AppString.serverFailure;
        }
      case CacheFailure:
        {
          statusRequest = StatusRequest.offlinefailure;
          return AppString.cacheFailure;
        }
      default:
        {
          statusRequest = StatusRequest.failure;
          return AppString.unexpectedError;
        }
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    email = TextEditingController();
    password = TextEditingController();
  }
}
