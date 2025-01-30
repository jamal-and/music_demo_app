import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_app/core/utils/assets.dart';
import 'package:music_app/general_export.dart';
import 'package:music_app/routes.dart';
import 'package:music_app/ui/widgets/csvg.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(2.seconds).then(
      (value) {
        Get.offAllNamed(routeLogin);
      },
    );
    return Scaffold(
      body: Center(
        child: MySvg(
          Assets.assetsSvgsLogo,
          width: 1.sw * 0.5,
        ),
      ),
    );
  }
}
