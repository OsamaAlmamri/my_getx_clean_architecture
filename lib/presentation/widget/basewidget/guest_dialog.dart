import 'package:flutter/material.dart';
import 'package:my_getx_clean_architecture/core/utils/custom_themes.dart';
import 'package:my_getx_clean_architecture/core/utils/dimensions.dart';
import 'package:my_getx_clean_architecture/core/utils/images.dart';
import 'package:get/get.dart';
import 'package:my_getx_clean_architecture/presentation/screens/auth/login.dart';

class GuestDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Stack(clipBehavior: Clip.none, fit: StackFit.loose, children: [

        Positioned(
          left: 0, right: 0, top: -50,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(40),
            child: Image.asset(Images.login, height: 80, width: 80),
          ),
        ),

        Padding(
          padding: EdgeInsets.only(top: 50),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [

              Text("THIS_SECTION_IS_LOCK".tr, style: robotoBold.copyWith(fontSize: Dimensions.FONT_SIZE_LARGE)),
              SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
              Text('GOTO_LOGIN_SCREEN_ANDTRYAGAIN'.tr, textAlign: TextAlign.center, style: titilliumRegular),
              SizedBox(height: Dimensions.PADDING_SIZE_LARGE),

              Divider(height: 0, color: Theme.of(context).hintColor),
              Row(children: [

                Expanded(child: InkWell(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    padding: EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10))),
                    child: Text('CANCEL'.tr, style: titilliumBold.copyWith(color: Theme.of(context).primaryColor)),
                  ),
                )),

                Expanded(child: InkWell(
                  onTap: () => Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) => Login()), (route) => false),
                  child: Container(
                    padding: EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(color: Theme.of(context).primaryColor, borderRadius: BorderRadius.only(bottomRight: Radius.circular(10))),
                    child: Text(('LOGIN'.tr), style: titilliumBold.copyWith(color: Colors.white)),
                  ),
                )),

              ]),
            ],
          ),
        ),

      ]),
    );
  }
}
