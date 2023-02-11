import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:my_getx_clean_architecture/core/api/app_interceptors.dart';

class HomeBindings extends Bindings {
  @override
  void dependencies() {
    // Start 
    Get.put(AppIntercepters()) ;
    Get.put(LogInterceptor()) ;
  }
}
