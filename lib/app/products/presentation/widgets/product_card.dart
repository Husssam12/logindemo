import 'package:design/design.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../domain/entities/product/product.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key? key,
    required this.product,
    required this.colorScheme,
  }) : super(key: key);

  final Product product;
  final ColorScheme colorScheme;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: [
          Column(
            children: [
              Expanded(
                  flex: 2,
                  child: AppNetworkImage(
                    url: product.image,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  )),
              Padding(
                padding:
                    REdgeInsets.only(bottom: 12, left: 12, right: 12, top: 32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    YouText.titleSmall(
                      product.title,
                      maxLines: 1,
                      textOverflow: TextOverflow.ellipsis,
                    ),
                    const RSizedBox.vertical(12),
                    YouText.titleLarge(
                      '\$${product.price}',
                      textAlign: TextAlign.start,
                      maxLines: 1,
                      textOverflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
          Container(
            margin: REdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: REdgeInsets.all(8),
                  decoration: BoxDecoration(
                      color: colorScheme.surface,
                      borderRadius: BorderRadius.circular(15.r)),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      YouText.labelSmall(
                          product.rating.rate.toStringAsFixed(1)),
                      const RSizedBox.horizontal(2),
                      Icon(
                        FontAwesomeIcons.solidStar,
                        color: Colors.yellow,
                        size: 10.r,
                      )
                    ],
                  ),
                ),
                const FavoriteButton(
                  initValue: false,
                  favorColor: Colors.white,
                  icon: FontAwesomeIcons.heart,
                  favorIcon: FontAwesomeIcons.solidHeart,
                  size: 20,
                ),
              ],
            ),
          ),
          Positioned(
              bottom: 60.h,
              right: 8,
              child: Container(
                decoration: BoxDecoration(
                    color: PColors.primarySwatch.shade800,
                    borderRadius: BorderRadius.circular(15.r)),
                child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.add_shopping_cart,
                      color: colorScheme.onSurface,
                    )),
              )),
        ],
      ),
    );
  }
}
