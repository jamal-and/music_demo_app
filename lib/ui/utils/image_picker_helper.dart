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

// Example usage:

void _pickImages() async {
  final List<XFile>? pickedImages = await pickMultipleImagesFromGallery();

  if (pickedImages != null) {
    // Do something with the picked images
    for (var image in pickedImages) {
      print('Image path: ${image.path}');
      // You can display the image using Image.file:
      // Image.file(File(image.path))
    }
  }
}
