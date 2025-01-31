import 'package:image_picker/image_picker.dart';

Future<List<XFile>?> pickMultipleImagesFromGallery() async {
  final ImagePicker picker = ImagePicker();

  try {
    final List<XFile> images = await picker.pickMultiImage();

    return images; // Return the list of picked images
  } catch (e) {
    // Handle any errors during image picking
    print('Error picking images: $e');
    return null;
  }
}

Future<XFile?> pickImageFromCamera() async {
  final ImagePicker picker = ImagePicker();

  try {
    final XFile? images = await picker.pickImage(source: ImageSource.camera);

    return images; // Return the list of picked images
  } catch (e) {
    // Handle any errors during image picking
    print('Error picking images: $e');
    return null;
  }
}
