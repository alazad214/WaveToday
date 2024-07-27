import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:wavetoday/service/news_service.dart';
import 'package:wavetoday/widgets/slider_simmer.dart';

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
              itemCount: 8,
              itemBuilder: (BuildContext context, int itemIndex,
                      int pageViewIndex) =>
                  Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 10),
                      width: double.infinity,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(5.0)),
                      child: Stack(
                        clipBehavior: Clip.antiAlias,
                        children: [
                          CachedNetworkImage(
                              fit: BoxFit.cover,
                              imageUrl: data[itemIndex].urlToImage.toString(),
                              width: double.infinity,
                              placeholder: (context, url) => const Center(
                                  child: CircularProgressIndicator()),
                              errorWidget: (context, url, error) => Container(
                                    padding: const EdgeInsets.only(right: 30),
                                    child: Image.asset(
                                      "assets/images/icon/logopng.png",
                                      fit: BoxFit.cover,
                                    ),
                                  )),
                        ],
                      )),
              options: CarouselOptions(
                  autoPlay: true, height: 140, clipBehavior: Clip.antiAlias),
            );
          }
          return SliderSimmer();
        });
  }
}
