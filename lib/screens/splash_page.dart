import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wavetoday/auth/login/login_screen.dart';

import 'homepage.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Timer set for 50 seconds
    Timer(const Duration(seconds: 3), () {
      Get.offAll(() =>  LoginScreen());
    });

    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Container(
                height: screenSize.height / 1,
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/images/icon/logopng.png",
                      height: screenSize.height / 12,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const CircularProgressIndicator(
                      color: Colors.lightBlue,
                      strokeWidth: 5,
                    )
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
