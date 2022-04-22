import 'package:core/core.dart';
import 'package:logindemo/app/products/domain/repositories/repo.dart';
import 'package:network/api_result.dart';

import '../domain/entities/category.dart';
import '../domain/entities/product/product.dart';

class ProductFacade {
  final IProductRepo _productRepo;

  ProductFacade(this._productRepo);

  Future<ApiResult<List<Category>>> getCategories() {
    return toApiResult(
      () => _productRepo.getCategories(),
    );
  }

  Future<ApiResult<List<Product>>> getProducts(Params params) {
    return toApiResult(
      () => _productRepo.getProducts(params),
    );
  }
}
