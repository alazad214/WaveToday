import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeController extends GetxController {
  String themekey = "isDark";
  RxBool isDark = false.obs;

  @override
  void onInit() {
    loadTheme();
    super.onInit();
  }

  loadTheme() async {
    SharedPreferences prefe = await SharedPreferences.getInstance();
    isDark.value = prefe.getBool(themekey) ?? false;
    Get.changeThemeMode(isDark.value ? ThemeMode.dark : ThemeMode.light);
  }

  toggleTheme() async {
    SharedPreferences prefe = await SharedPreferences.getInstance();
    isDark.value = !isDark.value;
    prefe.setBool(themekey, isDark.value);
    Get.changeThemeMode(isDark.value ? ThemeMode.dark : ThemeMode.light);
  }
}
