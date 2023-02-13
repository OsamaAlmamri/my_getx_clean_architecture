import 'package:dartz/dartz.dart';
import 'package:my_getx_clean_architecture/core/usecases/usecase.dart';
import 'package:my_getx_clean_architecture/data/models/GetProductOptionsModel.dart';
import 'package:my_getx_clean_architecture/data/models/product_paging_model.dart';
import 'package:my_getx_clean_architecture/data/repositories/product_repository_impl.dart';
import 'package:my_getx_clean_architecture/domain/entities/auth/user.dart';
import 'package:my_getx_clean_architecture/domain/entities/product.dart';

import '../../../../core/error/failures.dart';

class ProductUseCase implements UseCase<ProductsPagesModel, GetProductOptionsModel> {
  final ProductRepositoryImpl productRepositoryImpl;

  ProductUseCase({required this.productRepositoryImpl});

  @override
  Future<Either<Failure, ProductsPagesModel>> call(GetProductOptionsModel options) =>
      productRepositoryImpl.getProducts(options);
}
