import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_getx_clean_architecture/core/utils/app_colors.dart';
import 'package:my_getx_clean_architecture/core/widgets/handlingdataview.dart';
import 'package:my_getx_clean_architecture/features/random_quote/presentation/controllers/random_quote_controller.dart';
import 'package:my_getx_clean_architecture/features/random_quote/presentation/widgets/quote_screen_content.dart';
import 'package:my_getx_clean_architecture/features/splash/presentation/screens/controllers/changelocal.dart';


class QuoteScreen extends StatefulWidget {
  const QuoteScreen({Key? key}) : super(key: key);

  @override
  State<QuoteScreen> createState() => _QuoteScreenState();
}

class _QuoteScreenState extends State<QuoteScreen> {

  RandomQuoteController randomQuoteController = Get.find();


  _getRandomQuote() =>
      randomQuoteController.getRandomQuote();

  @override
  void initState() {
    super.initState();
    _getRandomQuote();
  }

  Widget _buildBodyContent() {
    return  GetBuilder<RandomQuoteController>(
        builder:
        ((controller) => HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: Center(
              child: Column(
                children: [
                  QuoteContent(
                    quote: randomQuoteController.quote,
                  ),
                  InkWell(
                      onTap: () => randomQuoteController.getRandomQuote(),
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 15),
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: AppColors.primary),
                        child: const Icon(
                          Icons.refresh,
                          size: 28,
                          color: Colors.white,
                        ),
                      ))
                ],
              ),
            ))));
  }

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      leading: IconButton(
        icon: Icon(
          Icons.translate_outlined,
          color: AppColors.primary,
        ),
        onPressed: () {
          LocaleController localeController=Get.find();
          String lo=localeController.currentLang!.languageCode;
          if (lo=="ar") {
            localeController.changeLang("en");
          } else {
            localeController.changeLang("ar");
          }
        },
      ),
      title:Text("app_name".tr),
    );
    return RefreshIndicator(
        child: Scaffold(appBar: appBar, body: _buildBodyContent()),
        onRefresh: () => _getRandomQuote());
  }
}
