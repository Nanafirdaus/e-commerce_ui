import 'package:e_commerce_ui/models/product.dart';
import 'package:flutter/material.dart';

class LikeScreen extends StatelessWidget {
  final List<Product> likedProduct;
  const LikeScreen({required this.likedProduct, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Liked Items"),
      ),
      body: ListView.builder(
          itemCount: likedProduct.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(likedProduct[index].name!),
            );
          }),
    );
  }
}
