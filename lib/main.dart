import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:music_app/core/injection.dart';
import 'package:music_app/routes.dart';
import 'package:music_app/ui/styles/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      child: GetMaterialApp(
        initialBinding: AppBinding(),
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: AppColors.primary,
            surface: AppColors.background,
            primary: AppColors.primary,
          ),
          fontFamily: 'Montserrat',
          useMaterial3: true,
        ),
        getPages: routes,
      ),
    );
  }
}
