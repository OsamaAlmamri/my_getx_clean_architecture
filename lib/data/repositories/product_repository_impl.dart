import 'package:get/get.dart';
import 'package:my_getx_clean_architecture/core/error/exceptions.dart';
import 'package:my_getx_clean_architecture/core/network/netwok_info.dart';
import 'package:my_getx_clean_architecture/data/datasources/products_remote_data_source.dart';
import 'package:my_getx_clean_architecture/data/models/GetProductOptionsModel.dart';
import 'package:my_getx_clean_architecture/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:my_getx_clean_architecture/data/models/product_paging_model.dart';
import 'package:my_getx_clean_architecture/domain/entities/product.dart';
import 'package:my_getx_clean_architecture/domain/repositories/auth/products_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  final NetworkInfoImpl networkInfo = Get.find();
  final ProductsRemoteDataSourceImpl productsRemoteDataSourceImpl = Get.find();

  @override
  Future<Either<Failure, ProductsPagesModel>> getProducts(
      GetProductOptionsModel options) async {
    try {
      print("user");
      final user = await productsRemoteDataSourceImpl.getProducts(options);

      print("user");
      return Right(user);
    } on ServerException {
      return Left(ServerFailure(ServerException));
    } catch (err) {
      return Left(ServerFailure(err));
    }
    // } else {
    //
    // }
  }
}
