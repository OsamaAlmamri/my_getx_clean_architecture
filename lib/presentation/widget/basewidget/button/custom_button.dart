import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_getx_clean_architecture/core/utils/color_resources.dart';
import 'package:my_getx_clean_architecture/core/utils/custom_themes.dart';
import 'package:my_getx_clean_architecture/core/utils/dimensions.dart';
class CustomButton extends StatelessWidget {
  final Function? onTap;
  final String buttonText;
  final bool isBuy;
  final bool isBorder;
  CustomButton({  this.onTap, required this.buttonText, this.isBuy= false, this.isBorder = false});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed:()=>onTap ,
      style: TextButton.styleFrom(padding: EdgeInsets.all(0)),
      child: Container(
        height: 45,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: ColorResources.getChatIcon(context),
            boxShadow: [
              BoxShadow(color: Colors.grey.withOpacity(0.2), spreadRadius: 1, blurRadius: 7, offset: Offset(0, 1)), // changes position of shadow
            ],
            gradient: (Get.isDarkMode || onTap == null) ? null : isBuy?
            LinearGradient(colors: [
              Color(0xffFE961C),
              Color(0xffFE961C),
              Color(0xffFE961C),
            ]):
            LinearGradient(colors: [
              Theme.of(context).primaryColor,
              Theme.of(context).primaryColor,
              Theme.of(context).primaryColor,
            ]),
            borderRadius: BorderRadius.circular(isBorder? Dimensions.PADDING_SIZE_EXTRA_SMALL : Dimensions.PADDING_SIZE_SMALL)),
        child: Text(buttonText,
            style: titilliumSemiBold.copyWith(
              fontSize: 16,
              color: Theme.of(context).highlightColor,
            )),
      ),
    );
  }
}
