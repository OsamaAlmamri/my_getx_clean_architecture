import 'package:get/get.dart';
import 'package:my_getx_clean_architecture/data/datasources/login_remote_data_source.dart';
import 'package:my_getx_clean_architecture/data/repositories/login_repository_impl.dart';
import 'package:my_getx_clean_architecture/domain/usecases/auth/login_usecase.dart';
import 'package:my_getx_clean_architecture/features/random_quote/data/datasources/random_quote_local_data_source.dart';
import 'package:my_getx_clean_architecture/features/random_quote/data/datasources/random_quote_remote_data_source.dart';
import 'package:my_getx_clean_architecture/features/random_quote/data/repositories/quote_repository_impl.dart';
import 'package:my_getx_clean_architecture/features/random_quote/domain/repositories/quote_repository.dart';
import 'package:my_getx_clean_architecture/features/random_quote/domain/usecases/get_random_quote.dart';
import 'package:my_getx_clean_architecture/features/random_quote/presentation/controllers/random_quote_controller.dart';
import 'package:my_getx_clean_architecture/presentation/controllers/Login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController(loginUseCase: Get.find()));
    Get.lazyPut(() => LoginUseCase(loginRepositoryImpl:Get.find()));
    Get.lazyPut(() => LoginRepositoryImpl());
    Get.lazyPut(() => LoginRemoteDataSourceImpl());

  }
}
