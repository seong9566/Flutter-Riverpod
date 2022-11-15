import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_test/pages/product.dart';

final productProvider =
    StateNotifierProvider<ProductRepository, Product>((ref) {
  return ProductRepository();
});

class ProductRepository extends StateNotifier<Product> {
  ProductRepository() : super(Product(1, "바나나", 1000));
}
