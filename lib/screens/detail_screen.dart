import 'package:e_commerce_ui/models/product.dart';
import 'package:e_commerce_ui/screens/cart_screen.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  final Product product;
  const DetailScreen({required this.product, super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: Stack(children: [
          Positioned(
            left: 0,
            top: 0,
            child: Container(
              width: screenWidth,
              height: screenHeight / 2,
              decoration: const BoxDecoration(
                color: Colors.black,
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text.rich(
                      TextSpan(
                        text: "Hijab\n",
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        children: [
                          TextSpan(
                            text: widget.product.name!,
                            style: const TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Center(
                      child: Container(
                        width: 180,
                        height: 160,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(10),
                          ),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(widget.product.imageUrl!),
                          ),
                        ),
                      ),
                    ),
                    Text.rich(
                      TextSpan(
                        text: "Price\n",
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        children: [
                          TextSpan(
                            text: widget.product.price!,
                            style: const TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            left: 0,
            bottom: 0,
            child: Container(
              height: screenHeight / 2,
              width: screenWidth,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadiusDirectional.only(
                  topStart: Radius.circular(16),
                  topEnd: Radius.circular(16),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      widget.product.description!,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            setState(() {
                              widget.product.decrementCount();
                            });
                          },
                          icon: const Icon(
                            Icons.remove,
                            size: 28,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          widget.product.count.toString(),
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[500],
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              widget.product.incrementCount();
                            });
                          },
                          icon: const Icon(
                            Icons.add,
                            size: 28,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(
                          width: 100,
                        ),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              widget.product.isLiked = !widget.product.isLiked!;
                            });
                          },
                          icon: Icon(
                            widget.product.isLiked!
                                ? Icons.favorite
                                : Icons.favorite_border_outlined,
                            size: 28,
                            color: widget.product.isLiked!
                                ? Colors.red
                                : Colors.black,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Stack(
                          alignment: Alignment.topRight,
                          children: [
                            const Icon(
                              Icons.shopping_cart,
                              color: Colors.black,
                              size: 40,
                            ),
                            Badge.count(
                              count: widget.product.count!,
                              backgroundColor: Colors.red,
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            foregroundColor: Colors.white,
                            shape: const BeveledRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(5),
                              ),
                            ),
                            padding: const EdgeInsets.only(left: 85, right: 85),
                          ),
                          onPressed: () {
                            widget.product.count == 0
                                ? ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      duration: Duration(seconds: 2),
                                      showCloseIcon: true,
                                      content: Text(
                                        "There's nothing to buy in cart",
                                      ),
                                    ),
                                  )
                                : Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return const CartScreen();
                                      },
                                    ),
                                  );
                          },
                          child: const Text("BUY NOW"),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
