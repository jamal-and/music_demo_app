import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_app/core/utils/show_messages.dart';

bool isLoading = false;

void showLoadingOverlay() {
  if (isLoading) {
    return;
  }
  isLoading = true;
  Get.dialog(
    const Center(child: CircularProgressIndicator.adaptive()),
    barrierDismissible: false,
  );
}

void hideLoadingOverlay() {
  if (Get.isDialogOpen ?? false) {
    Get.back();
    isLoading = false;
  }
}

Future<R?> withLoadingOverlay<R>(Future<R> Function() future) async {
  showLoadingOverlay();
  try {
    return await future();
  } catch (e) {
    showErrorMessage(message: "Error during operation: $e");
    rethrow;
  } finally {
    hideLoadingOverlay();
  }
}
