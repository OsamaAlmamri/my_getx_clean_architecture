import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:my_getx_clean_architecture/core/utils/color_resources.dart';
import 'package:my_getx_clean_architecture/core/utils/custom_themes.dart';
import 'package:my_getx_clean_architecture/core/utils/dimensions.dart';
import 'package:my_getx_clean_architecture/core/utils/product_type.dart';
import 'package:my_getx_clean_architecture/presentation/screens/home/widget/products_view.dart';


class AllProductScreen extends StatelessWidget {
  final ScrollController _scrollController = ScrollController();
  final ProductType productType;
  AllProductScreen({required this.productType});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: ColorResources.getHomeBg(context),
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Get.isDarkMode ?
        Colors.black : Theme.of(context).primaryColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(5), bottomLeft: Radius.circular(5))),
        leading: IconButton(icon: Icon(Icons.arrow_back_ios, size: 20,
            color: ColorResources.WHITE),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(productType == ProductType.FEATURED_PRODUCT ?
        'Featured Product':'Latest Product',
            style: titilliumRegular.copyWith(fontSize: 20, color: ColorResources.WHITE)),
      ),

      body: SafeArea(
        child: RefreshIndicator(
          backgroundColor: Theme.of(context).primaryColor,
          onRefresh: () async {
            // return true;
          },
          child: CustomScrollView(
            controller: _scrollController,
            slivers: [
              SliverToBoxAdapter(

                child: Padding(
                  padding: EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL),
                  child: ProductView(isHomePage: false , productType: productType, scrollController: _scrollController),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
