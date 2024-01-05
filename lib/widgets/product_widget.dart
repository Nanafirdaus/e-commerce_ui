import 'package:e_commerce_ui/models/product.dart';
import 'package:flutter/material.dart';

class ProductWidget extends StatelessWidget {
  final Product product;

  const ProductWidget({
    required this.product,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 130,
          height: 120,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            ),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(product.imageUrl!),
            ),
          ),
        ),
        Text(
          product.name!,
          style: const TextStyle(
            fontSize: 16,
          ),
        ),
        Text(
          product.price!,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
  }
}
