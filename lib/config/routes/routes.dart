import 'package:my_getx_clean_architecture/features/random_quote/presentation/controllers/random_quote_binding.dart';
import 'package:my_getx_clean_architecture/features/random_quote/presentation/screens/quote_view.dart';
import '../../features/splash/presentation/screens/splash_screen.dart';
import 'package:get/get.dart';
class Routes {
  static const String initialRoute = '/';
  static const String randomQuoteRoute = '/randomQuote';
}

List<GetPage<dynamic>>? routes = [
  GetPage(name:  Routes.initialRoute, page: () => const SplashScreen()),
  GetPage(name:  Routes.randomQuoteRoute, page: () => const QuoteScreen(),binding: RandomQuoteBinding()),

];
