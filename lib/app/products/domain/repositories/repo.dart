import 'package:core/core.dart';
import 'package:logindemo/app/products/domain/entities/category.dart';

import '../entities/product/product.dart';

abstract class IProductRepo {
  Future<List<Product>> getProducts(Params params);
  Future<List<Category>> getCategories();
}
