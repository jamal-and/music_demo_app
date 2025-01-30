import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:music_app/ui/utils/image_picker_helper.dart';
import 'package:music_app/ui/utils/loading_helper.dart';

class ProfileViewmodel extends GetxController {
  String selectedCatogry = 'Collection';
  List<XFile> imagesFiles = [];

  setSelectedCatogry(String newCategory) {
    selectedCatogry = newCategory;
    update();
  }

  pickImages() async {
    showLoadingOverlay();
    final newImages = await pickMultipleImagesFromGallery();

    if (newImages != null) {
      imagesFiles.addAll(newImages);
      update();
    }
    hideLoadingOverlay();
  }

  onDeletes(XFile image) {
    imagesFiles.remove(image);
    Get.back();
    update();
  }
}
