import 'package:dartz/dartz.dart';
import 'package:my_getx_clean_architecture/core/error/failures.dart';

abstract class LangRepository {
  Future<Either<Failure, bool>> changeLang({required String langCode});
  Future<Either<Failure, String>> getSavedLang();
}
