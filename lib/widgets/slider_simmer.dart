import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SliderSimmer extends StatelessWidget {
  const SliderSimmer({super.key});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    return CarouselSlider.builder(
      itemCount: 8,
      itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) =>
          Container(
              margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              width: double.infinity,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(5.0)),
              child: Stack(
                clipBehavior: Clip.antiAlias,
                children: [
                  Container(
                    decoration: const BoxDecoration(color: Colors.grey),
                    child: Lottie.asset("assets/anim/shimmer.json",
                        fit: BoxFit.cover),
                  )
                ],
              )),
      options: CarouselOptions(
          autoPlay: true, height: 140, clipBehavior: Clip.antiAlias),
    );
  }
}
