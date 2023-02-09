import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_getx_clean_architecture/features/splash/presentation/screens/controllers/changelocal.dart';
import 'package:my_getx_clean_architecture/config/localization/translation.dart';
import 'package:my_getx_clean_architecture/config/routes/routes.dart';
import 'package:my_getx_clean_architecture/core/bindings/intialbindings.dart';
import 'package:my_getx_clean_architecture/core/utils/app_strings.dart';

class QuoteApp extends StatelessWidget {
   QuoteApp({Key? key}) : super(key: key);
  LocaleController controller = Get.put(LocaleController());
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      translations: MyTranslation(),
      title: AppString.appName,
      locale: controller.currentLang,
      theme: controller.appTheme,
      debugShowCheckedModeBanner: false,
      getPages: routes,
      initialBinding: InitialBindings(),

    );
  }
}
