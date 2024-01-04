import 'package:flutter/material.dart';

class ProductWidget extends StatelessWidget {
  final String imgUrl, name, price;

  const ProductWidget({
    required this.imgUrl,
    required this.name,
    required this.price,
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
              image: AssetImage(imgUrl),
            ),
          ),
        ),
        Text(
          name,
          style: const TextStyle(
            fontSize: 16,
          ),
        ),
        Text(
          price,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
  }
}
