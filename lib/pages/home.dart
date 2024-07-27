import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:wavetoday/utils/app_color.dart';
import 'package:wavetoday/widgets/PopupMenu.dart';
import 'package:wavetoday/widgets/all_news.dart';
import 'package:wavetoday/widgets/breaking_news.dart';
import 'package:wavetoday/widgets/sliders.dart';

import '../controller/theme_controller.dart';

class Homepage extends StatelessWidget {
   Homepage({super.key});
  final ThemeController themeController = Get.put(ThemeController());
  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: AppColor.navyC,
            title:  const Text.rich(TextSpan(children: [
              TextSpan(
                  text: "News ",
                  style: TextStyle(
                      color: Colors.orange,
                      fontSize: 22,
                      fontWeight: FontWeight.bold)),
              TextSpan(
                  text: "Wave",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontFamily: "Lato_Ragular",
                      fontWeight: FontWeight.bold)),
            ])),
            actions: [
              IconButton(
                  onPressed: () {
                    themeController.toggleTheme();
                  },
                  icon:  Icon(
                    themeController.isDark.value?Icons.dark_mode:Icons.light_mode,
                    color: Colors.white,
                  )),
              const Popupmenu(),
            ],
          ),
          body: const Column(
            children: [
              Sliders(),
              TabBar(
                indicatorColor: Colors.indigoAccent,
                labelStyle:
                    TextStyle(fontSize: 18, fontWeight: FontWeight.bold, fontFamily: "Lato"),
                labelColor: Colors.indigoAccent,
                unselectedLabelColor: Colors.grey,
                dividerColor: Colors.transparent,
                tabs: [
                  Tab(
                    text: "All News",
                  ),
                  Tab(
                    text: "Top News",
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Flexible(
                  child: TabBarView(children: [
                AllNews(),
                BreakingNews(),
              ]))
            ],
          )),
    );
  }
}
