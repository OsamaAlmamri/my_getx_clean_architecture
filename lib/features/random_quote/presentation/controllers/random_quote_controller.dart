import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:get/get.dart';
import 'package:my_getx_clean_architecture/core/api/handingdatacontroller.dart';
import 'package:my_getx_clean_architecture/core/error/failures.dart';
import 'package:my_getx_clean_architecture/core/usecases/usecase.dart';
import 'package:my_getx_clean_architecture/core/utils/app_strings.dart';
import 'package:my_getx_clean_architecture/core/widgets/statusrequest.dart';
import 'package:my_getx_clean_architecture/features/random_quote/domain/usecases/get_random_quote.dart';
import '../../domain/entities/quote.dart';


class RandomQuoteController extends GetxController {
  late StatusRequest statusRequest;
  final GetRandomQuote getRandomQuoteUseCase;
  late Quote quote;
  RandomQuoteController({required this.getRandomQuoteUseCase})  : super();

  Future<void> getRandomQuote() async {
    statusRequest = StatusRequest.loading;
    update();
    Either<Failure, Quote> response = await getRandomQuoteUseCase(NoParams());
    var res = response.fold(
        (failure)  { print(" ----------- response");  print(response);   print(failure); _mapFailureToMsg(failure); handlingData(response);} ,
        (q) {    quote=q;   statusRequest = StatusRequest.success; });

    update();
  }

  String _mapFailureToMsg(Failure failure) {

    print("failure");
    print(failure);
    switch (failure.runtimeType) {
      case ServerFailure:
        {
          statusRequest = StatusRequest.serverfailure;
          return AppString.serverFailure;
        }
      case CacheFailure:
        {
          statusRequest = StatusRequest.offlinefailure;
          return AppString.cacheFailure;
        }
      default:
        {
          statusRequest = StatusRequest.failure;
          return AppString.unexpectedError;
        }
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    quote = new Quote(author: "author", id: 1, content: "555");
    statusRequest = StatusRequest.success;
    getRandomQuote();
  }
}
