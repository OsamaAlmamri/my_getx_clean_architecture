import 'dart:convert';
import 'package:get/get.dart';
import 'package:my_getx_clean_architecture/core/error/exceptions.dart';
import 'package:my_getx_clean_architecture/core/utils/app_strings.dart';
import 'package:my_getx_clean_architecture/features/random_quote/data/models/quote_model.dart';
import 'package:shared_preferences/shared_preferences.dart';


abstract class RandomQuoteLocalDataSource {
  Future<QuoteModel> getLastRandomQuote();
  Future<void> cacheQuote(QuoteModel quote);
}

class RandomQuoteLocalDataSourceImpl implements RandomQuoteLocalDataSource {
  final SharedPreferences sharedPreferences=Get.find();


  @override
  Future<QuoteModel> getLastRandomQuote() {
    final jsonString =
        sharedPreferences.getString(AppString.cachedRandomQuote);
    if (jsonString != null) {
      final cacheRandomQuote =
          Future.value(QuoteModel.fromJson(json.decode(jsonString)));
      return cacheRandomQuote;
    } else {
      throw CacheException();
    }
  }

  @override
  Future<void> cacheQuote(QuoteModel quote) {
    return sharedPreferences.setString(
        AppString.cachedRandomQuote, json.encode(quote));
  }
}
