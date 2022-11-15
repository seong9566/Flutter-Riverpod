import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_test/pages/product.dart';

final productListProvider =
    StateNotifierProvider<ProductListRepository, List<Product>>((ref) {
  // List문법
  return ProductListRepository();
});

class ProductListRepository extends StateNotifier<List<Product>> {
  ProductListRepository()
      : super([
          Product(1, "사과", 1000),
          Product(2, "바나나", 2000),
          Product(3, "딸기", 3000),
        ]);
}
