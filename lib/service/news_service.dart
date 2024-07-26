import 'dart:convert';
import "package:http/http.dart" as http;
import 'package:wavetoday/model/news_model.dart';

class NewsService {
  final allNews =
      "GET https://newsapi.org/v2/everything?q=bitcoin&apiKey=3b628fc737e04183b0067302d664b893";
  final breakingNews =
      "GET https://newsapi.org/v2/top-headlines?country=us&apiKey=3b628fc737e04183b0067302d664b893";

//BREAKING NEWS GET
  Future<List<NewsModel>> getBreakingNews() async {
    var response = await http.get(Uri.parse(breakingNews));

    if (response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(response.body);
      List<dynamic> data = json['articles'];
      List<NewsModel> articles =
          data.map((dynamic item) => NewsModel.fromJson(item)).toList();
      return articles;
    } else {
      throw "Not news found";
    }
  }

  //ALL NEWS GET

  Future<List<NewsModel>> getAllnews() async {
    var response = await http.get(Uri.parse(allNews));

    if (response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(response.body);
      List<dynamic> data = json["articles"];
      List<NewsModel> articales =
          data.map((dynamic item) => NewsModel.fromJson(item)).toList();
      return articales;
    } else {
      throw "Not news found";
    }
  }
}
