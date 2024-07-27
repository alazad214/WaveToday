import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:wavetoday/model/news_model.dart';
import 'package:wavetoday/widgets/shimmer.dart';

import '../service/news_service.dart';
import '../utils/app_color.dart';

class AllNews extends StatelessWidget {
  AllNews({super.key});
  NewsService newsService = NewsService();
  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: FutureBuilder(
          future: newsService.getBreakingNews(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<NewsModel> articleModel = snapshot.data ?? [];
              return ListView.builder(
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {},
                    child: SizedBox(
                      width: 200.0,

                      child: Shimmer(
                      )
                    )
                  );

                  //NewsItemList(newsModel: articleModel[index]);
                },
                itemCount: articleModel.length,
              );
            } else {}
            return Shimmer();
          }),
    );
  }
}
