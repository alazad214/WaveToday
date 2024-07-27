import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wavetoday/utils/app_color.dart';

import '../controller/theme_controller.dart';
import '../model/news_model.dart';

class NewsDetails extends StatelessWidget {
  final NewsModel newsModel;
  NewsDetails({super.key, required this.newsModel});
  final ThemeController themeController = Get.put(ThemeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
        backgroundColor: AppColor.navyC,
        title: Text(
          newsModel.title.toString(),
          style: const TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView(
        shrinkWrap: true,
        children: [
          CachedNetworkImage(
            height: 200,
            width: double.infinity,
            fit: BoxFit.cover,
            imageUrl: newsModel.urlToImage.toString(),
            placeholder: (context, url) =>
                const Center(child: CircularProgressIndicator()),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 15, right: 5, bottom: 10, top: 15),
            child: Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 15),
                  color: Colors.blue,
                  width: 5,
                  height: 70,
                ),
                Flexible(
                  child: Text(
                    newsModel.title.toString(),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: themeController.isDark.value
                            ? Colors.white
                            : Colors.black),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Flexible(
              child: Text(
                "Discription",
                overflow: TextOverflow.ellipsis,
                maxLines: 3,
                style: TextStyle(
                    color: themeController.isDark.value
                        ? Colors.white
                        : Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              newsModel.content.toString(),
              style: TextStyle(
                  fontSize: 16,
                  color: themeController.isDark.value
                      ? Colors.white
                      : Colors.black),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Center(
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: AppColor.navyC,
                  backgroundColor: AppColor.navyC,
                  shadowColor: Colors.blueAccent, // Shadow color
                  elevation: 5, // Elevation of the button
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12), // Rounded corners
                  ),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 32, vertical: 16), // Padding
                ),
                onPressed: () async {
                  final Uri url = Uri.parse(newsModel.url.toString());
                  if (!await launchUrl(url)) {
                    throw Exception('Could not launch $url');
                  }
                },
                child: const Text(
                  "Read More",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                )),
          )
        ],
      ),
    );
  }
}
