import 'package:flutter/material.dart';
import 'package:my_getx_clean_architecture/core/api/end_points.dart';
import 'package:my_getx_clean_architecture/core/utils/color_resources.dart';
import 'package:my_getx_clean_architecture/core/utils/custom_themes.dart';
import 'package:my_getx_clean_architecture/core/utils/dimensions.dart';
import 'package:my_getx_clean_architecture/core/utils/images.dart';
import 'package:my_getx_clean_architecture/core/utils/price_converter.dart';
import 'package:my_getx_clean_architecture/domain/entities/product.dart';
import 'package:my_getx_clean_architecture/presentation/screens/product/product_details_screen.dart';
import 'package:my_getx_clean_architecture/presentation/widget/basewidget/rating_bar.dart';



class ProductWidget extends StatelessWidget {
  final Product productModel;
  ProductWidget({required this.productModel});

  @override
  Widget build(BuildContext context) {
    String ratting = productModel.rating.toString() ;
    // String ratting = productModel.rating != null && productModel.rating.length != 0? productModel.rating[0].average : "0";

    return InkWell(
      onTap: () {
        // Navigator.push(context, PageRouteBuilder(
        //   transitionDuration: Duration(milliseconds: 1000),
        //   pageBuilder: (context, anim1, anim2) => ProductDetails(productId: productModel.id,slug: productModel.name.ar),
        // ));
      },
      child: Container(
        height: MediaQuery.of(context).size.width/1.5,
        margin: EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Theme.of(context).highlightColor,
          boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.2), spreadRadius: 1, blurRadius: 5)],
        ),
        child: Stack(children: [
          Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            // Product Image
            Container(
              height: MediaQuery.of(context).size.width/2.62,
              decoration: BoxDecoration(
                color: ColorResources.getIconBg(context),
                borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                child: FadeInImage.assetNetwork(
                  placeholder: Images.placeholder, fit: BoxFit.cover,
                  height: MediaQuery.of(context).size.width/2.45,
                  image: '${EndPoints.baseUrl+ productModel.image}',
                  // image: '${Provider.of<SplashProvider>(context, listen: false).baseUrls.productThumbnailUrl}/${productModel.thumbnail}',
                  imageErrorBuilder: (c, o, s) => Image.asset(Images.placeholder_1x1,
                      fit: BoxFit.cover,height: MediaQuery.of(context).size.width/2.45),
                ),
              ),
            ),

            // Product Details
            Padding(
              padding: EdgeInsets.only(top :Dimensions.PADDING_SIZE_SMALL,bottom: 5, left: 5,right: 5),
              child: Container(

                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(productModel.name.ar ?? '', textAlign: TextAlign.center,
                          style: robotoRegular.copyWith(fontSize: Dimensions.FONT_SIZE_SMALL,
                          fontWeight: FontWeight.w400), maxLines: 2,
                          overflow: TextOverflow.ellipsis),
                      SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL),

                      Row(mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RatingBar(
                              rating: double.parse(ratting),
                              size: 18,
                            ),


                        Text('(0)',
                            style: robotoRegular.copyWith(
                              fontSize: Dimensions.FONT_SIZE_SMALL,
                            )),

                      ]),
                      SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL),


                        productModel.discountPrice!= null && productModel.discountPrice > 0 ?
                        Text( productModel.price.toString(),
                        // Text(PriceConverter.convertPrice(context, productModel.unitPrice),
                        style: titleRegular.copyWith(
                          color: ColorResources.getRed(context),
                          decoration: TextDecoration.lineThrough,

                          fontSize: Dimensions.FONT_SIZE_EXTRA_SMALL,
                        ),
                      ) : SizedBox.shrink(),
                      SizedBox(height: 2,),


                      Text(PriceConverter.convertPrice(context,
                          productModel.price.toDouble(), discountType: productModel.discountType,
                          discount: productModel.discountPrice.toDouble()),
                        style: titilliumSemiBold.copyWith(color: ColorResources.getPrimary(context)),
                      ),



                    ],
                  ),
                ),
              ),
            ),
          ]),

          // Off

          productModel.discountPrice > 0 ?
          Positioned(top: 0, left: 0, child: Container(
              height: 20,
              padding: EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_EXTRA_SMALL),
              decoration: BoxDecoration(
                color: ColorResources.getPrimary(context),
                borderRadius: BorderRadius.only(topLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
              ),


              child: Center(
                child: Text(PriceConverter.percentageCalculation(context, productModel.price.toDouble(),
                      productModel.discountPrice.toDouble(), productModel.discountType),
                  style: robotoRegular.copyWith(color: Theme.of(context).highlightColor,
                      fontSize: Dimensions.FONT_SIZE_SMALL),
                ),
              ),
            ),
          ) : SizedBox.shrink(),

        ]),
      ),
    );
  }
}
