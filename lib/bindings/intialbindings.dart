import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:my_getx_clean_architecture/core/api/api_consumer.dart';
import 'package:my_getx_clean_architecture/core/api/app_interceptors.dart';
import 'package:my_getx_clean_architecture/core/api/dio_consumer.dart';
import 'package:my_getx_clean_architecture/core/network/netwok_info.dart';
import 'package:my_getx_clean_architecture/features/splash/presentation/screens/controllers/changelocal.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() async{
    // Start
    //final NetworkInfo networkInfo= Get.find();
    //   final RandomQuoteRemoteDataSource randomQuoteRemoteDataSource= Get.find();
    //   final RandomQuoteLocalDataSource randomQuoteLocalDataSource= Get.find();



    //! Core
    // Get.lazyPut(()=>NetworkInfo());
    // Get.put(ApiConsumer(Get.find()));
    Get.lazyPut(() => LogInterceptor(
        request: true,
        requestBody: true,
        requestHeader: true,
        responseBody: true,
        responseHeader: true,
        error: true));

    Get.lazyPut(() => NetworkInfoImpl());
    Get.lazyPut(() => DioConsumer(client: Get.find(),logInterceptor:Get.find(),appIntercepters:Get.find()));



    Get.put(Dio());

    //! External

    Get.put(InternetConnectionChecker());
    // Get.put(SharedPreferences());
    final sharedPreferences = await SharedPreferences.getInstance();
    // sl.registerLazySingleton(() => sharedPreferences);
    Get.put(sharedPreferences);
    //



    Get.lazyPut(() => AppIntercepters());
    Get.lazyPut(() => LocaleController());

    Get.lazyPut(() => InternetConnectionChecker());
    Get.lazyPut(() => Dio());

  }
}
