import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:wavetoday/auth/signup/register_screen.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_textfield.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white70,
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
        width: double.infinity,
        height: h / 1,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.black,
              Colors.black,
              Colors.blue.withOpacity(0.9),
              Colors.blue,
            ],
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/login.png",
                height: h / 4,
              ),
              const Text(
                "Please enter the details below to continue!",
                style: TextStyle(color: Colors.grey, fontSize: 14),
              ),
              Container(
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                margin:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                decoration: BoxDecoration(
                    color: Colors.transparent.withOpacity(0.3),
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  children: [
                    CustomTextfield(
                      hinttext: "Enter your email",
                      onchanged: (email) {},
                    ),
                    CustomTextfield(
                      hinttext: "Enter your password",
                      issecured: true,
                      icon: const Icon(Icons.remove_red_eye),
                      onchanged: (password) {},
                    ),
                    const Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        "Forget password?",
                        style: TextStyle(color: Colors.amberAccent),
                      ),
                    ),
                    SizedBox(height: 10),
                    CustomButton(
                      text: "Log in",
                      ontap: () {},
                    )
                  ],
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("You have an no account?  "),
                  InkWell(
                    onTap: () {
                      Get.offAll(() => RegisterScreen());
                    },
                    child: const Text(" Register",
                        style: TextStyle(
                            color: Colors.amberAccent,
                            fontWeight: FontWeight.w600,
                            fontSize: 16)),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
