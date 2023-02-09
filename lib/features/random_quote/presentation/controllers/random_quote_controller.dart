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

    Either<Failure, Quote> response = await getRandomQuoteUseCase(NoParams());

    print("=============================================");
    print("++++++++++++++++++");
    var res = response.fold(
        (failure) => handlingData(response) ,
        (q) {    quote=q;   statusRequest = StatusRequest.success; });

    update();
    // var res =   response.fold((l) => l, (r) => r);
    // // quote=res;
    // print("------------");
    print("quote");
    print(quote);
    // quote=res;
  }

  String _mapFailureToMsg(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return AppString.serverFailure;
      case CacheFailure:
        return AppString.cacheFailure;
      default:
        return AppString.unexpectedError;
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
