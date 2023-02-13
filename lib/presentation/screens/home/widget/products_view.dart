import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_getx_clean_architecture/core/utils/dimensions.dart';
import 'package:my_getx_clean_architecture/core/utils/product_type.dart';

import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:my_getx_clean_architecture/domain/entities/product.dart';
import 'package:my_getx_clean_architecture/presentation/controllers/products_controller.dart';
import 'package:my_getx_clean_architecture/presentation/widget/basewidget/product_shimmer.dart';
import 'package:my_getx_clean_architecture/presentation/widget/basewidget/product_widget.dart';

class ProductView extends StatelessWidget {
  final bool isHomePage;
  final ProductType productType;
  final ScrollController scrollController;
  String sellerId;

  ProductView(
      {required this.isHomePage,
      required this.productType,
      required this.scrollController,
      this.sellerId = ""});

  @override
  Widget build(BuildContext context) {
    int offset = 1;

    ProductController controller = Get.find();
    List<Product> productList;
    productList = controller.products as List<Product>;



    scrollController?.addListener(() {
      if(scrollController.position.maxScrollExtent == scrollController.position.pixels
          && controller.products.length != 0
          && !controller.filterIsLoading.value) {
        if(controller.paging.value!.currentPage < controller.paging.value!.lastPage ) {
          print(controller.paging.value!.currentPage);
          controller.showBottomLoader();
          controller.getProducts(page: controller.paging.value!.currentPage+1);
        }else{
        }
      }
    });
//  List<Product> productList = [];
//         if(productType == ProductType.LATEST_PRODUCT) {
//           productList = prodProvider.lProductList;
//         }
//         else if(productType == ProductType.FEATURED_PRODUCT) {
//           productList = prodProvider.featuredProductList;
//         }else if(productType == ProductType.TOP_PRODUCT) {
//           productList = prodProvider.latestProductList;
//         }else if(productType == ProductType.BEST_SELLING) {
//           productList = prodProvider.latestProductList;
//         }else if(productType == ProductType.NEW_ARRIVAL) {
//           productList = prodProvider.latestProductList;
//         }
//
//         else if(productType == ProductType.SELLER_PRODUCT) {
//           productList = prodProvider.sellerProductList;
//           print('==========>Product List ==${prodProvider.firstLoading}====>${productList.length}');
//         }
//
//         print('========hello hello===>${productList.length}');


    return  Obx(() =>   Column(children: [

      // Text("data"),
      controller.filterFirstLoading.value
          ? productList.length != 0
              ? StaggeredGridView.countBuilder(
                  itemCount: isHomePage
                      ? productList.length > 4
                          ? 4
                          : productList.length
                      : productList.length,
                  crossAxisCount: 2,
                  padding: EdgeInsets.all(0),
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  staggeredTileBuilder: (int index) => StaggeredTile.fit(1),
                  itemBuilder: (BuildContext context, int index) {
                    return ProductWidget(productModel: productList[index]);
                  },
                )
              : SizedBox.shrink()
          : ProductShimmer(
              isHomePage: isHomePage, isEnabled: controller.firstLoading.value),
      controller.filterIsLoading.value
          ? Center(
              child: Padding(
              padding: EdgeInsets.all(Dimensions.ICON_SIZE_EXTRA_SMALL),
              child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                      Theme.of(context).primaryColor)),
            ))
          : SizedBox.shrink(),
    ]));
  }
}
