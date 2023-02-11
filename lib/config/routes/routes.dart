import 'package:my_getx_clean_architecture/bindings/login_binding.dart';
import 'package:my_getx_clean_architecture/features/random_quote/presentation/controllers/random_quote_binding.dart';
import 'package:my_getx_clean_architecture/features/random_quote/presentation/screens/quote_view.dart';
import 'package:my_getx_clean_architecture/presentation/screens/auth/login.dart';
import '../../features/splash/presentation/screens/splash_screen.dart';
import 'package:get/get.dart';
class Routes {
  static const String initialRoute = '/';
  static const String loginRoute = '/login';
  static const String randomQuoteRoute = '/randomQuote';
}

List<GetPage<dynamic>>? routes = [
  GetPage(name:  Routes.loginRoute, page: () => const Login()),
  GetPage(name:  Routes.initialRoute, page: () => const Login(),binding: LoginBinding()),
  GetPage(name:  Routes.randomQuoteRoute, page: () => const QuoteScreen(),binding: RandomQuoteBinding()),

];
