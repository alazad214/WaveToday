import 'package:another_carousel_pro/another_carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:wavetoday/model/news_model.dart';
import 'package:wavetoday/service/news_service.dart';
import 'package:wavetoday/widgets/PopupMenu.dart';
import 'package:wavetoday/widgets/sliders.dart';

class Homepage extends StatelessWidget {
  Homepage({super.key});

  final newsService = NewsService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.indigoAccent,
          title: const Text.rich(TextSpan(children: [
            TextSpan(
                text: "News ",
                style: TextStyle(
                    color: Colors.orange,
                    fontSize: 22,
                    fontWeight: FontWeight.bold)),
            TextSpan(
                text: "Wave",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold)),
          ])),
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.dark_mode,
                  color: Colors.white,
                )),
            const Popupmenu(),
          ],
        ),
        body: Column(
          children: [Sliders()],
        ));
  }
}
