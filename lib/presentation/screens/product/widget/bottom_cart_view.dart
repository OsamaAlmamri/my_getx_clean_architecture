// import 'package:flutter/material.dart';
// import 'package:my_getx_clean_architecture/core/utils/color_resources.dart';
// import 'package:my_getx_clean_architecture/core/utils/custom_themes.dart';
// import 'package:my_getx_clean_architecture/core/utils/dimensions.dart';
// import 'package:my_getx_clean_architecture/core/utils/images.dart';
// import 'package:my_getx_clean_architecture/presentation/screens/cart/cart_screen.dart';
// import 'package:my_getx_clean_architecture/presentation/screens/product/widget/cart_bottom_sheet.dart';
//
// class BottomCartView extends StatelessWidget {
//   final ProductDetailsModel product;
//   BottomCartView({required this.product});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 60,
//       padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
//       decoration: BoxDecoration(
//         color: Theme.of(context).highlightColor,
//         borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
//         boxShadow: [BoxShadow(color: Theme.of(context).hintColor, blurRadius: .5, spreadRadius: .1)],
//       ),
//       child: Row(children: [
//         Expanded(flex: 3, child: Padding(
//           padding: EdgeInsets.all(Dimensions.PADDING_SIZE_EXTRA_SMALL),
//           child: Stack(children: [
//             GestureDetector(
//                 onTap: (){
//                   Navigator.of(context).push(MaterialPageRoute(
//                       builder: (context)=>CartScreen()
//                   ));
//                 },
//                 child: Image.asset(Images.cart_arrow_down_image, color: ColorResources.getPrimary(context))),
//             Positioned(
//               top: 0,
//               right: 15,
//               child: Consumer<CartProvider>(builder: (context, cart, child) {
//                 return Container(
//                   height: 17,
//                   width: 17,
//                   alignment: Alignment.center,
//                   decoration: BoxDecoration(
//                     shape: BoxShape.circle,
//                     color: ColorResources.getPrimary(context),
//                   ),
//                   child: Text(
//                     cart.cartList.length.toString(),
//                     style: titilliumSemiBold.copyWith(fontSize: Dimensions.FONT_SIZE_EXTRA_SMALL, color:Theme.of(context).highlightColor),
//                   ),
//                 );
//               }),
//             )
//           ]),
//         )),
//
//         Expanded(flex: 11, child: InkWell(
//           onTap: () {
//             showModalBottomSheet(context: context, isScrollControlled: true,
//                 backgroundColor: Theme.of(context).primaryColor.withOpacity(0),
//                 builder: (con) => CartBottomSheet(product: product, callback: (){
//               showCustomSnackBar(getTranslated('added_to_cart', context), context, isError: false);
//             },));
//           },
//           child: Container(
//             height: 50,
//             margin: EdgeInsets.symmetric(horizontal: 5),
//             alignment: Alignment.center,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(10),
//               color: ColorResources.getPrimary(context),
//             ),
//             child: Text(
//               getTranslated('add_to_cart', context),
//               style: titilliumSemiBold.copyWith(fontSize: Dimensions.FONT_SIZE_LARGE, color: Theme.of(context).highlightColor),
//             ),
//           ),
//         )),
//       ]),
//     );
//   }
// }
