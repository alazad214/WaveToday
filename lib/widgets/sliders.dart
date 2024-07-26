import 'package:another_carousel_pro/another_carousel_pro.dart';
import 'package:flutter/cupertino.dart';

class Sliders extends StatelessWidget {
  const Sliders({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
        height: 170.0,
        width: double.infinity,
        padding: const EdgeInsets.all(15),
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: AnotherCarousel(
            dotSize: 4,
            dotSpacing: 0,
            radius: const Radius.circular(10.0),
            borderRadius: true,
            autoplayDuration: const Duration(seconds: 10),
            images: [
              for (int i = 0; i < 10; i++)
                Image.asset(
                  "assets/images/news.jpg",
                  fit: BoxFit.cover,
                ),
            ]));
  }
}
