import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:wavetoday/screens/homepage.dart';

class AuthController extends GetxController {
  RxString name = RxString("");
  RxString email = RxString("");
  RxString password = RxString("");
  RxString confirmpassword = RxString("");
  final auth = FirebaseAuth.instance;
  final user = FirebaseAuth.instance.currentUser;

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
          Get.offAll(() => const Homepage());
        }
      });
    } on FirebaseAuthException catch (error) {
      Get.snackbar("Error", error.message ?? "Something Wrong");
    }
  }
}
