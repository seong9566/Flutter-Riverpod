// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_test/pages/product.dart';
import 'package:flutter_riverpod_test/pages/product_list_repository.dart';
import 'package:flutter_riverpod_test/pages/product_repository.dart';

import 'counter_provider.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);
// int, String 모두 쌍따옴표 안에 넣어야 널값이 안들어오고 안전하다.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = ref.watch(counterProvider);
    final product = ref.watch(productProvider);
    final productList = ref.watch(productListProvider);
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: productList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text("${productList[index].name}"),
                    subtitle: Text("${productList[index].price}"),
                  );
                }),
          ),
          ElevatedButton(
              onPressed: () {
                final productList2 = ref.read(productListProvider.notifier);
                productList2.state = [
                  ...productList2.state,
                  Product(4, "고구마", 5000)
                ];
              },
              child: Text(
                "상품 추가",
                style: TextStyle(fontSize: 50, fontWeight: FontWeight.w600),
              )),
          Text(
            "${count}",
            style: TextStyle(fontSize: 50, fontWeight: FontWeight.w600),
          ),
          Text(
            "${product.name}",
            style: TextStyle(fontSize: 50, fontWeight: FontWeight.w600),
          ),
          ElevatedButton(
              onPressed: () {
                ref.read(counterProvider.notifier).increment();
              },
              child: Text(
                "클릭",
                style: TextStyle(fontSize: 50, fontWeight: FontWeight.w600),
              )),
        ],
      ),
    );
  }
}
