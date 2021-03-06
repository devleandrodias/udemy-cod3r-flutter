import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shop/data/dummy_data.dart';
import 'package:shop/providers/product_provider.dart';

class ProductsProvider with ChangeNotifier {
  final List<Product> _items = dummyProducts;

  List<Product> get items => [..._items];

  int get itemsCount => _items.length;

  List<Product> get favoriteItens {
    return _items.where((element) => element.isFavorite).toList();
  }

  void addProduct(Product newProduct) {
    _items.add(
      Product(
        id: Random().nextDouble().toString(),
        description: newProduct.description,
        price: newProduct.price,
        imageUrl: newProduct.imageUrl,
        title: newProduct.title,
        isFavorite: newProduct.isFavorite,
      ),
    );
    notifyListeners();
  }

  void updateProduct(Product product) {
    if (product == null && product.id == null) return;

    final index = _items.indexWhere((element) => element.id == product.id);

    if (index <= 0) {
      _items[index] = product;
      notifyListeners();
    }
  }

  void deleteProduct(String id) {
    print(id);
    final index = _items.indexWhere((element) => element.id == id);

    if (index <= 0) {
      _items.removeWhere((element) => element.id == id);
      notifyListeners();
    }
  }
}

// bool _showFavoriteOnly = false;

// List<Product> get items {
//   if (_showFavoriteOnly) {
//     return _items.where((element) => (element.isFavorite)).toList();
//   } else {
//     return [..._items];
//   }
// }

// void showFavoriteOnly() {
//   _showFavoriteOnly = true;
//   notifyListeners();
// }

// void showAll() {
//   _showFavoriteOnly = false;
//   notifyListeners();
// }
