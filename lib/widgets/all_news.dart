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
          future: newsService.getAllNews(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<NewsModel> articleModel = snapshot.data ?? [];
              return ListView.builder(
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {},
                    child: Container(
                      height: 110,
                      clipBehavior: Clip.antiAlias,
                      margin: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 5),
                      decoration: BoxDecoration(
                          color: AppColor.navyC,
                          borderRadius: BorderRadius.circular(8)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CachedNetworkImage(
                              height: 120,
                              width: w / 3.5,
                              fit: BoxFit.cover,
                              imageUrl:
                              articleModel[index].urlToImage.toString(),
                              placeholder: (context, url) => const Center(
                                  child: CircularProgressIndicator()),
                              errorWidget: (context, url, error) => Container(
                                padding: const EdgeInsets.only(right: 30),
                                child: Image.asset(
                                  "assets/images/icon/logopng.png",
                                ),
                              )),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(5),
                              child: Column(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    articleModel[index].title.toString(),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.public_sharp,
                                        color: Colors.amber,
                                      ),
                                      const SizedBox(width: 5),
                                      Flexible(
                                        child: Text(
                                          articleModel[index]
                                              .publishedAt
                                              .toString(),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                              color: Colors.amber,
                                              fontSize: 15),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  );

                  //NewsItemList(newsModel: articleModel[index]);
                },
                itemCount: articleModel.length,
              );
            } else {}
            return const Shimmer();
          }),
    );
  }
}
