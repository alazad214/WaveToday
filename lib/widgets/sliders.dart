import 'package:another_carousel_pro/another_carousel_pro.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:wavetoday/service/news_service.dart';

import '../model/news_model.dart';

class Sliders extends StatefulWidget {
  const Sliders({super.key});

  @override
  State<Sliders> createState() => _SlidersState();
}

class _SlidersState extends State<Sliders> {
  NewsService newsService = NewsService();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: newsService.getAllNews(),
        builder: (index, snapshot) {
          if (snapshot.hasData) {
            List<NewsModel> data = snapshot.data ?? [];
            return CarouselSlider.builder(
              itemCount: 15,
              itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) =>
                  Container(
                    height: 120,
                    margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    width: double.infinity,
                    color: Colors.blue,
                    child: Text(itemIndex.toString()),
                  ),
              options: CarouselOptions(
                autoPlay: true,
                height: 120
              ),
            );
          }
          return const Center(child: CircularProgressIndicator());
        });
  }
}
