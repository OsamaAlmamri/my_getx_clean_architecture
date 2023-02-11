import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_getx_clean_architecture/core/functions/alertexitapp.dart';
import 'package:my_getx_clean_architecture/core/functions/validinput.dart';
import 'package:my_getx_clean_architecture/core/utils/app_colors.dart';
import 'package:my_getx_clean_architecture/core/widgets/handlingdataview.dart';
import 'package:my_getx_clean_architecture/presentation/controllers/Login_controller.dart';
import 'package:my_getx_clean_architecture/presentation/widget/auth/custombuttonauth.dart';
import 'package:my_getx_clean_architecture/presentation/widget/auth/customtextbodyauth.dart';
import 'package:my_getx_clean_architecture/presentation/widget/auth/customtextformauth.dart';
import 'package:my_getx_clean_architecture/presentation/widget/auth/customtexttitleauth.dart';
import 'package:my_getx_clean_architecture/presentation/widget/auth/logoauth.dart';
import 'package:my_getx_clean_architecture/presentation/widget/auth/textsignup.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.backgroundcolor,
        elevation: 0.0,
        title: Text('Sign In',
            style: Theme.of(context)
                .textTheme
                .headline1!
                .copyWith(color: AppColors.grey)),
      ),
      body: WillPopScope(
          onWillPop: alertExitApp,
          child: GetBuilder<LoginController>(
            builder: (controller) => HandlingDataRequest(
                statusRequest: controller.statusRequest,
                widget: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                  child: Form(
                    key: controller.formstate,
                    child: ListView(children: [
                      const LogoAuth(),
                      const SizedBox(height: 20),
                      CustomTextTitleAuth(text: "Welcome Back".tr),
                      const SizedBox(height: 10),
                      CustomTextBodyAuth(text: "login_description".tr),
                      const SizedBox(height: 15),
                      CustomTextFormAuth(
                        isNumber: false,
                        isEmail: true,
                        valid: (val) {
                          return validInput(val!, 5, 100, "email");
                        },
                        mycontroller: controller.email,
                        hinttext: "Enter Your Email".tr,
                        iconData: Icons.email_outlined,
                        labeltext: "18".tr,
                        // mycontroller: ,
                      ),
                      GetBuilder<LoginController>(
                        builder: (controller) => CustomTextFormAuth(
                          obscureText: controller.isshowpassword,
                          onTapIcon: () {
                            controller.showPassword();
                          },
                          isNumber: false,
                          valid: (val) {
                            return validInput(val!, 3, 30, "password");
                          },
                          mycontroller: controller.password,
                          hinttext: "Enter Your Password".tr,
                          iconData: Icons.lock_outline,
                          labeltext: "Password".tr,
                          // mycontroller: ,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          controller.goToForgetPassword();
                        },
                        child: Text(
                          "Forget Password".tr,
                          textAlign: TextAlign.right,
                        ),
                      ),
                      CustomButtomAuth(
                          text: "Sign In".tr,
                          onPressed: () {
                            controller.loginWithEmail();
                          }),
                      const SizedBox(height: 40),
                      CustomTextSignUpOrSignIn(
                        textone: "dont_have_account".tr,
                        texttwo: "Sign Up".tr,
                        onTap: () {
                          controller.goToSignUp();
                        },
                      )
                    ]),
                  ),
                )),
          )),
    );
  }
}
