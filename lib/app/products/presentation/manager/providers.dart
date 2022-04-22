import 'package:core/core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logindemo/app/products/application/facade.dart';
import 'package:logindemo/app/products/domain/entities/category.dart';
import 'package:logindemo/app/products/domain/entities/product/product.dart';

import '../../../../common/tuple.dart';
import '../../../../service_locator/service_locator.dart';

final categoriesStateProvider = StateNotifierProvider.autoDispose<
    CategoriesStateNotifier, PageState<Tuple2<List<Category>, Category?>>>(
  (ref) {
    return CategoriesStateNotifier(sl());
  },
);
final productsStateProvider = StateNotifierProvider.autoDispose<
    ProductsStateNotifier, PageState<List<Product>>>(
  (ref) {
    final stateNotifier = ProductsStateNotifier(sl());

    ref.listen<PageState<Tuple2<List<Category>, Category?>>>(
        categoriesStateProvider, (pre, next) {
      stateNotifier.fetch(next.data.b!.name);
    });
    return stateNotifier;
  },
);

class CategoriesStateNotifier
    extends StateNotifier<PageState<Tuple2<List<Category>, Category?>>> {
  CategoriesStateNotifier(this._productFacade) : super(const PageState.init()) {
    fetch();
  }

  final ProductFacade _productFacade;
  List<Category> categories = [];

  void fetch() {
    state = const PageState.loading();
    _productFacade.getCategories().then(
      (result) {
        result.when(success: (data) {
          state = PageState.loaded(data: Tuple2(data, data.first));
        }, failure: (message) {
          state = PageState.error(error: message);
        });
      },
    );
  }

  void categoryChanged(Category value) {
    state = state.loaded.copyWith(
      data: state.data.copyWith(b: value),
    );
  }
}

class ProductsStateNotifier extends StateNotifier<PageState<List<Product>>> {
  ProductsStateNotifier(this._productFacade) : super(const PageState.init());

  final ProductFacade _productFacade;
  List<Category> categories = [];

  void fetch(String categoryId) {
    state = const PageState.loading();
    _productFacade
        .getProducts(
      ParamsWrapper({
        'categoryId': categoryId,
      }),
    )
        .then(
      (result) {
        result.when(success: (data) {
          state = PageState.loaded(data: data);
        }, failure: (message) {
          state = PageState.error(error: message);
        });
      },
    );
  }
}
