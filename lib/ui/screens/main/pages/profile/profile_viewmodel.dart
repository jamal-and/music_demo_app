import 'package:get/get.dart';

class ProfileViewmodel extends GetxController {
  String selectedCatogry = 'Collection';
  setSelectedCatogry(String newCategory) {
    selectedCatogry = newCategory;
    update();
  }
}
