import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_getx_clean_architecture/core/error/failures.dart';
import 'package:my_getx_clean_architecture/core/widgets/statusrequest.dart';
import 'package:my_getx_clean_architecture/data/models/GetProductOptionsModel.dart';
import 'package:my_getx_clean_architecture/data/models/product_paging_model.dart';
import 'package:my_getx_clean_architecture/domain/entities/auth/user.dart';
import 'package:my_getx_clean_architecture/domain/entities/paging.dart';
import 'package:my_getx_clean_architecture/domain/entities/product.dart';
import 'package:my_getx_clean_architecture/domain/usecases/product_usecase.dart';

class ProductController extends GetxController {
  StatusRequest statusRequest = StatusRequest.none;
  final ProductUseCase productUseCase;

  // late List<Product> products = [];
  late List<Product> latestProductList = [];

  // late Paging paging;
  RxBool firstLoading = true.obs;
  RxBool isLoading = false.obs;
  RxBool filterIsLoading = false.obs;
  RxBool filterFirstLoading = false.obs;

  var paging = Rx<Paging?>(null);

  var products = RxList<Product>([]);
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  late TextEditingController email;
  late TextEditingController password;
  bool isshowpassword = true;


  void showBottomLoader() {

    firstLoading.value = true;
    isLoading.value = true;

  }

  ProductController({required this.productUseCase});

  goToForgetPassword() {
    // Get.toNamed(AppRoute.forgetPassword);
  }

  goToSignUp() {
    // Get.offNamed(AppRoute.signUp);
  }

  showPassword() {
    isshowpassword = isshowpassword == true ? false : true;
    update();
  }

  Future<void> getProducts({int page=1}) async {
    // statusRequest = StatusRequest.loading;
    // update();
    filterIsLoading.value = true;
    update();
    Either<Failure, ProductsPagesModel> response = await productUseCase(
        GetProductOptionsModel(
            page: page, rows_per_page: 5, search: "", category_id: 'all'));
    var res = response.fold((failure) {
      // Get.defaultDialog(
      //     title: "ُWarning", middleText: "Email Or Password Not Correct");
      print("errrrrr");
      print(failure);
      statusRequest = StatusRequest.failure;
    }, (q) {
      products.addAll(q.data);
      paging .value= q.meta;
      print("meta");
      print(q.data);
      firstLoading.value = false;
      filterIsLoading.value = false;
      isLoading.value = false;
      filterFirstLoading.value = true;
      update();
      statusRequest = StatusRequest.success;
    });

    update();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    getProducts();

    email = TextEditingController();
    password = TextEditingController();
  }
}
