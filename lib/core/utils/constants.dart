import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

const bool kDebugMode = true;
final flutterView = View.of(Get.context!);
double pixelRatio = flutterView.devicePixelRatio;

/// Size in logical pixels
Size logicalScreenSize = flutterView.physicalSize / pixelRatio;
final double screenRatio = (logicalScreenSize.height / logicalScreenSize.width);
// ignore: avoid_bool_literals_in_conditional_expressions
bool isThereSystemNav = screenRatio < 19.1 / 9 ? true : false;

///  ignore: duplicate_ignore
//double kDeviceWidth = 1.sw;
//double kDeviceHeight = 1.sh;

// General Spacing

final double horizontalSpacing = 0.05.sw;
final double verticalSpacing = 0.02.sh;

// Widgets Measures

final double fullWidthButtonHeight = 1.sh * 0.065;

final generalPadding = EdgeInsets.symmetric(
  vertical: verticalSpacing,
  horizontal: horizontalSpacing,
);
final generalSmallPadding = EdgeInsets.symmetric(
  vertical: verticalSpacing / 2,
  horizontal: horizontalSpacing / 2,
);
final inputPadding = EdgeInsets.symmetric(
  vertical: verticalSpacing / 2,
  horizontal: horizontalSpacing,
);

const Duration generalDuration = Duration(milliseconds: 400);

final generalRadius = BorderRadius.circular(horizontalSpacing);
