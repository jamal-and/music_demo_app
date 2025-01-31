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
    try {
      final newImages = await pickMultipleImagesFromGallery();
      if (newImages != null) {
        imagesFiles.addAll(newImages);
        update();
      }
    } catch (e) {
      print(e);
    }

    hideLoadingOverlay();
    Get.back();
  }

  pickImageFromCamer() async {
    showLoadingOverlay();
    try {
      final newImage = await pickImageFromCamera();
      if (newImage != null) {
        imagesFiles.add(newImage);
        update();
      }
    } catch (e) {
      print(e);
    }

    hideLoadingOverlay();
    Get.back();
  }

  onDeletes(XFile image) {
    imagesFiles.remove(image);
    Get.back();
    update();
  }
}
