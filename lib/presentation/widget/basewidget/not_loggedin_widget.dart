import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_getx_clean_architecture/core/utils/custom_themes.dart';
import 'package:my_getx_clean_architecture/core/utils/dimensions.dart';
import 'package:my_getx_clean_architecture/core/utils/images.dart';
import 'package:my_getx_clean_architecture/presentation/screens/auth/login.dart';
import 'package:my_getx_clean_architecture/presentation/widget/basewidget/button/custom_button.dart';

class NotLoggedInWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;

    return Padding(
        padding: EdgeInsets.all(_height*0.025),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(Images.login, height: _height*0.2, width: _width),
            SizedBox(height: _height*0.05),
            Text(('PLEASE_LOGIN_FIRST'.tr), textAlign: TextAlign.center, style: titilliumSemiBold.copyWith(fontSize: _height*0.017)),
            SizedBox(height: _height*0.05),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_LARGE),
              child: Container(
                width: MediaQuery.of(context).size.width/2,
                child: CustomButton(
                  buttonText: ('LOGIN'.tr),
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => Login())),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                // Provider.of<AuthProvider>(context, listen: false).updateSelectedIndex(1);
                // Navigator.push(context, MaterialPageRoute(builder: (context) => Login(initialPage: 1)));
              },
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: _height*0.02),
                child: Text(('create_new_account'.tr), style: titilliumRegular.copyWith(
                  color: Theme.of(context).primaryColor,
                  fontSize: Dimensions.FONT_SIZE_SMALL,
                )),
              ),
            ),
          ],
        ));
  }
}
