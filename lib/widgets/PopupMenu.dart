import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wavetoday/auth/login.dart';
import 'package:wavetoday/controller/auth_controller.dart';

class Popupmenu extends StatelessWidget {
  Popupmenu({super.key});
  final controller = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.signOut();
      },
      child: PopupMenuButton(
        icon: const Icon(
          Icons.more_vert,
          color: Colors.white,
        ),
        onSelected: (String value) {},
        itemBuilder: (BuildContext context) {
          return [
            PopupMenuItem(
                value: 'Option 1',
                onTap: () {},
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("LOG OUT"),
                  ],
                )),
          ];
        },
      ),
    );
  }
}
