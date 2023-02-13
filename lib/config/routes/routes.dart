import 'package:my_getx_clean_architecture/bindings/homebindings.dart';
import 'package:my_getx_clean_architecture/bindings/login_binding.dart';
import 'package:my_getx_clean_architecture/core/utils/product_type.dart';
import 'package:my_getx_clean_architecture/features/random_quote/presentation/controllers/random_quote_binding.dart';
import 'package:my_getx_clean_architecture/features/random_quote/presentation/screens/quote_view.dart';
import 'package:my_getx_clean_architecture/presentation/screens/auth/login.dart';
import 'package:my_getx_clean_architecture/presentation/screens/home/home_screens.dart';
import 'package:my_getx_clean_architecture/presentation/screens/product/view_all_product_screen.dart';
import '../../features/splash/presentation/screens/splash_screen.dart';
import 'package:get/get.dart';
class Routes {
  static const String initialRoute = '/';
  static const String loginRoute = '/login';
  static const String randomQuoteRoute = '/randomQuote';
  static const String HomeRoute = '/home';
}

List<GetPage<dynamic>>? routes = [
  GetPage(name:  Routes.initialRoute, page: () =>  AllProductScreen(productType:ProductType.ALL_PRODUCT),binding: HomeBindings()),
  GetPage(name:  Routes.HomeRoute, page: () =>  HomePage(),binding: HomeBindings()),
  GetPage(name:  Routes.loginRoute, page: () => const Login()),
  GetPage(name:  Routes.randomQuoteRoute, page: () => const QuoteScreen(),binding: RandomQuoteBinding()),

];
