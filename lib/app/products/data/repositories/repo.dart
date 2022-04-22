import 'package:core/core.dart';
import 'package:logindemo/app/products/data/remote/data_sources/product_remote.dart';
import 'package:logindemo/app/products/domain/entities/category.dart';
import 'package:logindemo/app/products/domain/entities/product/product.dart';
import 'package:logindemo/app/products/domain/repositories/repo.dart';

class ProductRepo extends IProductRepo {
  final ProductRemote _productRemote;

  ProductRepo(this._productRemote);

  @override
  Future<List<Category>> getCategories() {
    return _productRemote.getCategories().then((value) => value
        .map(
          (e) => e.toModel(),
        )
        .toList());
  }

  @override
  Future<List<Product>> getProducts(Params params) {
    return _productRemote.getProducts(params);
  }
}
