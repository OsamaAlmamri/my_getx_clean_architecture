import 'package:get/get.dart';
import 'package:my_getx_clean_architecture/core/api/dio_consumer.dart';
import 'package:my_getx_clean_architecture/core/api/end_points.dart';
import 'package:my_getx_clean_architecture/data/models/GetProductOptionsModel.dart';
import 'package:my_getx_clean_architecture/data/models/productModel.dart';
import 'package:my_getx_clean_architecture/data/models/product_paging_model.dart';
import 'package:my_getx_clean_architecture/data/models/user_model.dart';

abstract class ProductsRemoteDataSource {
  Future<ProductsPagesModel> getProducts(GetProductOptionsModel options);
}

class ProductsRemoteDataSourceImpl implements ProductsRemoteDataSource {
  DioConsumer apiConsumer = Get.find();

  @override
  Future<ProductsPagesModel> getProducts(GetProductOptionsModel options) async {
    final response = await apiConsumer.get(EndPoints.products,
        queryParameters: (options.toJson()));

    try{
      print("f");
      print("fmeta");
      print(response['data']);
    ProductsPagesModel f= ProductsPagesModel.fromJson(response);

    return  ProductsPagesModel.fromJson(response);
  }
  catch (err)
    {

    print("errrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr");
    print(err);
      return  ProductsPagesModel.fromJson(response);

    }
    }
}
