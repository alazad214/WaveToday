import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wavetoday/auth/login.dart';

class Popupmenu extends StatelessWidget {
  const Popupmenu({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      icon: const Icon(
        Icons.more_vert,
        color: Colors.white,
      ),
      onSelected: (String value) {},
      itemBuilder: (BuildContext context) {
        return [
          PopupMenuItem(
              value: 'Option 1',
              onTap: () {
                Get.to(() => LoginScreen());
              },
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("LOG OUT"),
                ],
              )),
        ];
      },
    );
  }
}
