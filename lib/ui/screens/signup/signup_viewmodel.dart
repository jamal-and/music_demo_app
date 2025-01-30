import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupViewmodel extends GetxController {
  int step = 0;
  String name = '';
  String username = '';

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController usernameController = TextEditingController();

  void onMainButtonPressed() {
    if (step == 1) {
      step = 0;
      update();
    } else {
      step++;
      update();
      //Get.offAllNamed(routeLogin);
    }
  }

  void onNameChange(String newName) {
    name = newName;
    update();
  }

  void onUsernameChange(String newUsername) {
    username = newUsername;
    update();
  }
}
