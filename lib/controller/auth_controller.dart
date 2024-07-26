import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:wavetoday/auth/login.dart';

import '../pages/home.dart';

class AuthController extends GetxController {
  RxString email = RxString("");
  RxString password = RxString("");
  final auth = FirebaseAuth.instance;
  final user = FirebaseAuth.instance.currentUser;
  RxString name = RxString("");
  RxString confirmpassword = RxString("");

  register() async {
    if (password != confirmpassword) {
      Get.snackbar("Error", "Password doesn't matched",
          snackPosition: SnackPosition.BOTTOM);
      return;
    }
    try {
      await auth
          .createUserWithEmailAndPassword(
              email: email.value, password: password.value)
          .then((value) {
        if (value.user != null) {
          Get.offAll(() =>  Homepage());
        }
      });
    } on FirebaseAuthException catch (error) {
      Get.snackbar("Error", error.message ?? "Something Wrong");
    }
  }

  login() async {
    try {
      await auth
          .signInWithEmailAndPassword(
              email: email.value, password: password.value)
          .then((value) {
        if (value.user != null) {
          Get.offAll(Homepage());
        }
      });
    } on FirebaseAuthException catch (error) {
      Get.snackbar("Error", error.message ?? "Something Wrong");
    }
  }

  Future signOut() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    try {
      await auth.signOut().then((value) {
        Get.offAll(LoginScreen());
      });
    } on FirebaseAuthException catch (e) {
      Get.snackbar("Error", e.message ?? "something wrong");
    }
  }
}
