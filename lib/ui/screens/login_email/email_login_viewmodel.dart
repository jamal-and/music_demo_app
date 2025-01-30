import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmailLoginViewmodel extends GetxController {
  int step = 0;
  TextEditingController emailController = TextEditingController();
  TextEditingController repeatPassworController = TextEditingController();
  TextEditingController passworController = TextEditingController();
  TextEditingController otpController = TextEditingController();

  GlobalKey<FormState> loginForm = GlobalKey<FormState>();
  GlobalKey<FormState> newPasswordForm = GlobalKey<FormState>();
  GlobalKey<FormState> recoverEmailForm = GlobalKey<FormState>();

  bool isHome = true;

  updateStep(int newStep) {
    step = newStep;
    update();
  }

  String? repeatPasswordValidator(String? email) {
    if (email == passworController.text) {
      return null;
    } else {
      return 'Password do not match';
    }
  }

  void onBackPress() {
    if (--step == -1) {
      Get.back();
    }
    update();
  }
}
