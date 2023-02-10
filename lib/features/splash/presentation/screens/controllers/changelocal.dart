import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_getx_clean_architecture/config/themes/app_theme.dart';
import 'package:my_getx_clean_architecture/core/services/services.dart';
import 'package:my_getx_clean_architecture/core/utils/app_strings.dart';

class LocaleController extends GetxController {
  Locale? currentLang;

  Future<void> _changeLang(String langCode) async {

    Locale locale = Locale(langCode);
    myServices.sharedPreferences.setString("lang", langCode);
    appTheme = langCode == "ar" ? themeArabic : themeEnglish;
    Get.changeTheme(appTheme);
    Get.updateLocale(locale);


  }

  void toEnglish() => _changeLang(AppString.englishCode);

  void toArabic() => _changeLang(AppString.arabicCode);

  MyServices myServices = Get.find();

  ThemeData appTheme = themeEnglish;

  changeLang(String langcode) {



    Locale locale = Locale(langcode);

    currentLang=locale;
    myServices.sharedPreferences.setString("lang", langcode);
    appTheme = langcode == "ar" ? themeArabic : themeEnglish;
    Get.changeTheme(appTheme);
    Get.updateLocale(locale);

    update();
  }

  @override
  void onInit() {
    String? sharedPrefLang = myServices.sharedPreferences.getString("lang");
    if (sharedPrefLang == "ar") {
      currentLang = const Locale("ar");
      appTheme = themeArabic;
    } else if (sharedPrefLang == "en") {
      currentLang = const Locale("en");
      appTheme = themeEnglish;
    } else {
      currentLang = Locale(Get.deviceLocale!.languageCode);
      appTheme = themeEnglish;
    }
    super.onInit();
  }
}
