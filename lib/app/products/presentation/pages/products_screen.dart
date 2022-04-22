import 'package:core/core.dart';
import 'package:design/design.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:logindemo/app/user/presentation/provider/provider.dart';
import 'package:logindemo/common/ext.dart';
import 'package:logindemo/common/tuple.dart';

import '../../domain/entities/category.dart';
import '../../domain/entities/product/product.dart';
import '../manager/providers.dart';
import '../widgets/drawer.dart';
import '../widgets/product_card.dart';

class ProductsScreen extends ConsumerWidget {
  const ProductsScreen({Key? key}) : super(key: key);

  static const path = '/products';
  static const name = 'products_screen';

  static final handler =
      Handler(handlerFunc: (context, Map<String, dynamic> params) {
    return const ProductsScreen();
  });

  @override
  Widget build(BuildContext context, ref) {
    final colorScheme = Theme.of(context).colorScheme;

    final user = ref.watch(userStateProvider);
    final categories = ref.watch(categoriesStateProvider);
    final products = ref.watch(productsStateProvider);
    return Scaffold(
      drawer: AppDrawer(user: user),
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_active_outlined),
          )
        ],
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            PageStateBuilder<Tuple2<List<Category>, Category?>>(
              state: categories,
              loading: () => LinearProgressIndicator(
                color: colorScheme.onSurface,
              ),
              error: (e) => FetchErrorWidget(
                error: e,
                onRetry: () {
                  ref.read(categoriesStateProvider.notifier).fetch();
                },
              ),
              success: (data) {
                return TabSelect<Category>(
                    indicatorColor: colorScheme.onSurface,
                    selectedItem: data.b,
                    onChanged: (value) {
                      ref
                          .read(categoriesStateProvider.notifier)
                          .categoryChanged(value);
                    },
                    items: data.a
                        .map((e) =>
                            TabItem(label: e.name.capitalize(), value: e))
                        .toList());
              },
            ),
            Expanded(
              child: PageStateBuilder<List<Product>>(
                state: products,
                loading: () => const Center(
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                ),
                success: (data) => AnimationLimiter(
                  child: GridView.builder(
                    padding: PEdgeInsets.listView,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 8.r,
                      mainAxisSpacing: 8.r,
                      childAspectRatio: 2 / 3,
                    ),
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      final product = data[index];
                      return AnimationConfiguration.staggeredList(
                        position: index,
                        duration: const Duration(milliseconds: 375),
                        child: SlideAnimation(
                          verticalOffset: 50.0,
                          child: FadeInAnimation(
                            child: ProductCard(
                                product: product, colorScheme: colorScheme),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
