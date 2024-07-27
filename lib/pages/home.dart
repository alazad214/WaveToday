import 'package:flutter/material.dart';
import 'package:wavetoday/widgets/PopupMenu.dart';
import 'package:wavetoday/widgets/all_news.dart';
import 'package:wavetoday/widgets/breaking_news.dart';
import 'package:wavetoday/widgets/sliders.dart';

class Homepage extends StatelessWidget {
  Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
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
            children: [
              const Sliders(),
              const TabBar(
                indicatorColor: Colors.indigoAccent,
                labelStyle:
                    TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                labelColor: Colors.indigoAccent,
                unselectedLabelColor: Colors.grey,
                dividerColor: Colors.transparent,
                tabs: [
                  Tab(
                    text: "Breaking",
                  ),
                  Tab(
                    text: "All",
                  ),
                ],
              ),
              const SizedBox(height: 15,),
              Flexible(child: TabBarView(children: [BreakingNews(), AllNews()]))
            ],
          )),
    );
  }
}
