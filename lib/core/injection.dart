import 'package:get/get.dart';
import 'package:music_app/ui/screens/main/pages/search/search_viewmodel.dart';

import 'controller/user_controller.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UserController());
    Get.lazyPut(() => SearchViewmodel());
  }
}
