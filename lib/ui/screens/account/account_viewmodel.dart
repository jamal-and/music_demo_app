import 'package:get/get.dart';
import 'package:music_app/core/controller/user_controller.dart';
import 'package:music_app/core/models/user.dart';

class AccountViewmodel extends GetxController {
  String gender = 'Male';
  User user = Get.find<UserController>().currentUser;
  setGender(String newGender) {
    gender = newGender;
    update();
  }

  onUserSave(User newUser) {
    final userController = Get.find<UserController>();
    userController.updateUser(name: newUser.name);
    update();
  }
}
