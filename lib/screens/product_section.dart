import 'package:e_commerce_ui/models/product.dart';
import 'package:e_commerce_ui/widgets/product_widget.dart';
import 'package:flutter/material.dart';

class ProductSection extends StatelessWidget {
  List<Product>? products;
  ProductSection({this.products, super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: products!.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemBuilder: (context, index) {
        Product product = products![index];
        return ProductWidget(
          product: product,
        );
      },
    );
  }
}
