import 'package:e_commerce_ui/models/hijab.dart';
import 'package:e_commerce_ui/widgets/product.dart';
import 'package:flutter/material.dart';

import '../models/hijab_list.dart';

class HijabSection extends StatelessWidget {
  const HijabSection({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: hijabs.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemBuilder: (context, index) {
        Hijab hijab = hijabs[index];
        return ProductWidget(
          imgUrl: hijab.hijabImageUrl!,
          name: hijab.hijabName!,
          price: hijab.price!,
        );
      },
    );
  }
}
