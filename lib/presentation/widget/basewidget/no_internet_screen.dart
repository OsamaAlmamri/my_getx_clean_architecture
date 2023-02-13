import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_getx_clean_architecture/core/utils/color_resources.dart';
import 'package:my_getx_clean_architecture/core/utils/custom_themes.dart';
import 'package:my_getx_clean_architecture/core/utils/dimensions.dart';
import 'package:my_getx_clean_architecture/core/utils/images.dart';


class NoInternetOrDataScreen extends StatelessWidget {
  final bool isNoInternet;
  final Widget? child;
  NoInternetOrDataScreen({required this.isNoInternet, this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(MediaQuery.of(context).size.height*0.025),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(isNoInternet ? Images.no_internet : Images.no_data, width: 150, height: 150),
            Text(isNoInternet ? ('OPPS'.tr) : ('sorry'.tr), style: titilliumBold.copyWith(
              fontSize: 30,
              color: isNoInternet ? Theme.of(context).textTheme.bodyText1?.color : ColorResources.getColombiaBlue(context),
            )),
            SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL),
            Text(
              isNoInternet ? ('no_internet_connection'.tr) : 'No data found',
              textAlign: TextAlign.center,
              style: titilliumRegular,
            ),
            SizedBox(height: 40),
            isNoInternet ? Container(
              height: 45,
              margin: EdgeInsets.symmetric(horizontal: 40),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: ColorResources.getYellow(context)),
              child: TextButton(
                onPressed: () async {
                  if(await Connectivity().checkConnectivity() != ConnectivityResult.none) {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => child!));
                  }
                },
                child: Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  child: Text(('RETRY'.tr), style: titilliumSemiBold.copyWith(color: Theme.of(context).highlightColor, fontSize: Dimensions.FONT_SIZE_LARGE)),
                ),
              ),
            ) : SizedBox.shrink(),

          ],
        ),
      ),
    );
  }
}
