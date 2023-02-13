import 'package:dartz/dartz.dart';
import 'package:my_getx_clean_architecture/data/models/GetProductOptionsModel.dart';
import 'package:my_getx_clean_architecture/data/models/login_model.dart';
import 'package:my_getx_clean_architecture/data/models/product_paging_model.dart';
import 'package:my_getx_clean_architecture/domain/entities/GetProductOptions.dart';
import 'package:my_getx_clean_architecture/domain/entities/product.dart';
import 'package:my_getx_clean_architecture/domain/entities/auth/user.dart';
import '../../../../core/error/failures.dart';

abstract class ProductRepository {
  Future<Either<Failure, ProductsPagesModel>> getProducts(GetProductOptionsModel options);
}
