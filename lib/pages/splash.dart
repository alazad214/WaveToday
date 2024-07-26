import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wavetoday/auth/login.dart';

import 'home.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    Future.delayed(const Duration(seconds: 4), () {
      if (user == null) {
        Get.offAll(() => LoginScreen());
      } else {
        Get.offAll(() => const Homepage());
      }
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
