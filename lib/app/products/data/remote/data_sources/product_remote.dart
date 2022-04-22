import 'package:core/core.dart';
import 'package:dio/dio.dart';
import 'package:logindemo/app/products/data/remote/models/category_dto.dart';
import 'package:logindemo/app/products/domain/entities/product/product.dart';
import 'package:logindemo/common/api_routes.dart';

class ProductRemote {
  final Dio _dio;

  ProductRemote(this._dio);

  Future<List<Product>> getProducts(Params params) async {
    final response = await _dio.get(
      APIRoutes.products + '/${params.toMap()['categoryId']}',
    );
    return throwAppException(
      () => (response.data as List).map((e) => Product.fromJson(e)).toList(),
    );
  }

  Future<List<CategoryDto>> getCategories() async {
    final response = await _dio.get(APIRoutes.categories);
    return throwAppException(
      () => (response.data as List)
          .map((category) => CategoryDto.fromMap(category))
          .toList(),
    );
  }
}
