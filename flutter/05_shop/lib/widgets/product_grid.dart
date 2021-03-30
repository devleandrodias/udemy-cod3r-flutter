import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/providers/products_provider.dart';
import 'package:shop/widgets/product_grid_item.dart';

class ProductsGrid extends StatelessWidget {
  final bool showFavoriteOnly;

  ProductsGrid(this.showFavoriteOnly);

  @override
  Widget build(BuildContext context) {
    final productsProvider = Provider.of<ProductsProvider>(context);

    final products = showFavoriteOnly
        ? productsProvider.favoriteItens
        : productsProvider.items;

    print(products[0]);

    return GridView.builder(
      padding: const EdgeInsets.all(10),
      itemCount: products.length,
      itemBuilder: (ctx, index) => ChangeNotifierProvider.value(
        value: products[index],
        child: ProductGridItem(),
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1.5,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
    );
  }
}
