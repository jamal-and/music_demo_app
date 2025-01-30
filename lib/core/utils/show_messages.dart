import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_app/core/utils/constants.dart';
import 'package:music_app/ui/styles/colors.dart';

// Function to show a snackbar message with customizable options
dynamic showMessage({
  // Required message to be displayed
  required String message,
  // Required title for the snackbar
  required String title,
  // Optional color for the message text
  Color? messageColor,
  // Optional icon widget to display
  Widget? icon,
  // Optional background color for the snackbar
  Color? background,
  // Optional duration in seconds for the snackbar to be displayed
  int seconds = 3,
}) {
  return ScaffoldMessenger.of(Get.context!).showSnackBar(
    buildMessage(
      icon: icon,
      title: title,
      messageColor: messageColor,
      message: message,
      background: background,
      seconds: seconds,
    ),
  );
}

// Function to show a success message with a green background
void showSuccessMessage({
  // Required message to be displayed
  required String message,
  // Optional title (defaults to 'Success')
  String title = 'Success',
  // Optional duration in seconds for the snackbar to be displayed
  int seconds = 3,
}) {
  // Call showMessage with predefined parameters for success message
  showMessage(
    message: message,
    title: title,
    seconds: seconds,
    icon: const Icon(
      CupertinoIcons.check_mark_circled_solid,
      color: Colors.white,
    ),
    messageColor: Colors.white,
    background: Colors.green[600],
  );
}

// Similar functions for showing warning, info, and error messages with predefined icons, colors, and titles

void showWarningMessage({
  required String message,
  String title = 'Warning',
  int seconds = 3,
}) =>
    showMessage(
      message: message,
      title: title,
      seconds: seconds,
      icon: const Icon(
        CupertinoIcons.exclamationmark_triangle_fill,
        color: Colors.white,
      ),
      messageColor: Colors.white,
      background: Colors.yellow[700],
    );

void showInfoMessage({
  required String message,
  String title = 'Info',
  int seconds = 3,
}) =>
    showMessage(
      message: message,
      title: title,
      seconds: seconds,
      icon: const Icon(
        CupertinoIcons.info_circle_fill,
        color: Colors.white,
      ),
      messageColor: Colors.white,
      background: Colors.blue[900],
    );

void showErrorMessage({
  required String message,
  String title = 'Error',
  int seconds = 3,
}) =>
    showMessage(
      message: message,
      seconds: seconds,
      title: title,
      icon: const Icon(
        Icons.error,
        color: Colors.white,
      ),
      messageColor: Colors.white,
      background: Colors.red[900],
    );

// Function to build the SnackBar UI
SnackBar buildMessage({
  Widget? icon,
  required String title,
  Color? messageColor,
  required String message,
  Color? background,
  int? seconds,
}) {
  return SnackBar(
    content: Row(
      children: [
        Padding(
          padding: EdgeInsets.only(right: horizontalSpacing),
          child: icon ?? const SizedBox(),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                    color: messageColor,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                message,
                style: TextStyle(color: messageColor),
              ),
            ],
          ),
        ),
      ],
    ),
    backgroundColor: background ?? AppColors.background.withOpacity(0.8),
    duration: Duration(seconds: seconds ?? 5),
    showCloseIcon: true,
    closeIconColor: messageColor,
  );
}
