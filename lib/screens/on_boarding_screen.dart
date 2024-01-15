import 'dart:math';

import 'package:e_commerce_ui/screens/home.dart';
import 'package:flutter/material.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

//bottle 2 candle 1, pillow 2 hijab 5
class _OnBoardingScreenState extends State<OnBoardingScreen> {
  PageController pageController = PageController();
  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(240, 248, 255, 1.0),
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            PageView(
              scrollDirection: Axis.horizontal,
              controller: pageController,
              physics: const BouncingScrollPhysics(),
              onPageChanged: (index) {
                setState(() {
                  pageIndex = index;
                });
              },
              children: [
                OnboardWidget(
                  imagePath: const ['hijabpic/image5', 'candlepic/candle1'],
                ),
                OnboardWidget(
                  imagePath: const ['bottlepic/bottle5', 'pillowpic/pillow3'],
                ),
                const GetStarted(),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    color: pageIndex == 0 ? Colors.brown : Colors.grey,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(
                  height: 230,
                  width: 3,
                ),
                Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    color: pageIndex == 1 ? Colors.brown : Colors.grey,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(
                  width: 3,
                ),
                Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    color: pageIndex == 2 ? Colors.brown : Colors.grey,
                    shape: BoxShape.circle,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class OnboardWidget extends StatelessWidget {
  List<String>? imagePath; 
  OnboardWidget({this.imagePath, super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Positioned(
          right: 40,
          child: Transform.rotate(
            angle: pi / 4,
            child: Image.asset(
              'assets/${imagePath![0]}.jpg',
              width: 130,
              height: 130,
            ),
          ),
        ),
        Positioned(
          left: 40,
          bottom: 250,
          child: Transform.rotate(
            angle: -pi / 4,
            child: Image.asset(
              'assets/${imagePath![1]}.jpg',
              width: 130,
              height: 130,
            ),
          ),
        ),
      ],
    );
  }
}

class GetStarted extends StatelessWidget {
  const GetStarted({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 20, right: 20),
          child: Text(
            "Embark on a journey of style, serenity, and comfort. Elevate your wardrobe with exquisite hijabs, set the perfect ambiance with scented candles, and indulge in the coziness of our luxurious pillows. Your unique experience awaits.",
            style: TextStyle(
              color: Colors.black,
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return const HomeScreen();
                },
              ),
            );
          },
          child: const Text("Get started"),
        )
      ],
    );
  }
}
