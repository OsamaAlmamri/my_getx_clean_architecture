import 'package:get/get.dart';
import 'package:my_getx_clean_architecture/data/datasources/products_remote_data_source.dart';
import 'package:my_getx_clean_architecture/data/repositories/product_repository_impl.dart';
import 'package:my_getx_clean_architecture/domain/usecases/product_usecase.dart';
import 'package:my_getx_clean_architecture/presentation/controllers/products_controller.dart';

class HomeBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProductController(productUseCase: Get.find()));
    Get.lazyPut(() => ProductUseCase(productRepositoryImpl:Get.find()));
    Get.lazyPut(() => ProductRepositoryImpl());
    Get.lazyPut(() => ProductsRemoteDataSourceImpl());

  }
}
