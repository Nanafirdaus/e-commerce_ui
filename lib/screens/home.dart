import 'package:e_commerce_ui/models/bottle_list.dart';
import 'package:e_commerce_ui/models/candle_list.dart';
import 'package:e_commerce_ui/models/hijab_list.dart';
import 'package:e_commerce_ui/models/pillow_list.dart';
import 'package:e_commerce_ui/screens/product_section.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 4,
        child: NestedScrollView(
          headerSliverBuilder: (context, value) {
            return [
              const SliverAppBar(
                backgroundColor: Colors.black,
                toolbarHeight: 30,
                title: Text("Women"),
                actions: [
                  Icon(
                    Icons.favorite,
                    color: Colors.red,
                    size: 30,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Stack(
                    alignment: Alignment.topRight,
                    children: [
                      Icon(
                        Icons.shopping_cart_outlined,
                        size: 30,
                      ),
                      Badge(
                        backgroundColor: Colors.red,
                      )
                    ],
                  ),
                ],
                bottom: TabBar(
                  tabs: [
                    Tab(
                      text: "Hijab",
                    ),
                    Tab(
                      text: "Candle",
                    ),
                    Tab(
                      text: "Bottle",
                    ),
                    Tab(
                      text: "Pillow",
                    ),
                  ],
                ),
              ),
            ];
          },
          body: TabBarView(
            children: [
              ProductSection(
                products: hijabs,
              ),
              ProductSection(
                products: candles,
              ),
              ProductSection(
                products: bottles,
              ),
              ProductSection(
                products: pillows,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
