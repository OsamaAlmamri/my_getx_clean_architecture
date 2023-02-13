import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_getx_clean_architecture/domain/entities/product.dart';
import 'package:my_getx_clean_architecture/presentation/controllers/products_controller.dart';
import 'package:my_getx_clean_architecture/presentation/widget/basewidget/product_shimmer.dart';
import 'package:my_getx_clean_architecture/presentation/widget/basewidget/product_widget.dart';

class LatestProductView extends StatelessWidget {
  final ScrollController scrollController;

  LatestProductView({required this.scrollController});

  @override
  Widget build(BuildContext context) {
    int offset = 1;
    scrollController?.addListener(() {
      // if(scrollController.position.maxScrollExtent == scrollController.position.pixels
      //     && Provider.of<ProductProvider>(context, listen: false).lProductList.length != 0
      //     && !Provider.of<ProductProvider>(context, listen: false).isLoading) {
      //   int pageSize;
      //   pageSize = Provider.of<ProductProvider>(context, listen: false).lPageSize;
      //
      //   if(offset < pageSize) {
      //     offset++;
      //     print('end of the page');
      //     Provider.of<ProductProvider>(context, listen: false).showBottomLoader();
      //     Provider.of<ProductProvider>(context, listen: false).getLatestProductList(offset, context);
      //   }
      // }
    });
    ProductController controller =Get.find();
    List<Product> productList;
    productList = controller.products;

    return Column(children: [
      controller.firstLoading.value
          ? productList.length != 0
              ? Container(
                  height: MediaQuery.of(context).size.width / 1.45,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: productList.length,
                      itemBuilder: (ctx, index) {
                        return Container(
                            width: (MediaQuery.of(context).size.width / 2) - 20,
                            child: ProductWidget(
                                productModel: productList[index]));
                      }),
                )
              : SizedBox.shrink()
          : ProductShimmer(
              isHomePage: true, isEnabled: controller.firstLoading.value),
      // prodProvider.isLoading ? Center(child: Padding(
      //   padding: EdgeInsets.all(Dimensions.ICON_SIZE_EXTRA_SMALL),
      //   child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor)),
      // )) : SizedBox.shrink(),
    ]);
  }
}
