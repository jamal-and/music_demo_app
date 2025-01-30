import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_app/general_export.dart';
import 'package:music_app/routes.dart';
import 'package:music_app/ui/widgets/app_bar.dart';
import 'package:music_app/ui/widgets/csvg.dart';
import 'package:music_app/ui/widgets/dialogs.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.shapeBackground,
      body: SafeArea(
        child: Column(
          children: [
            const CAppBar(
              title: 'Settings',
            ),
            generalBox,
            buidlSettingItem(
              title: 'Account',
              icon: Assets.assetsSvgsUser,
              onTap: () {
                Get.toNamed(Get.currentRoute + routeAccount);
              },
            ),
            buidlSettingItem(
              title: 'Subscription',
              icon: Assets.assetsSvgsStar,
            ),
            buidlSettingItem(
              title: 'Privacy Policy',
              icon: Assets.assetsSvgsInfo,
              onTap: () {
                Get.toNamed(Get.currentRoute + routePrivacyPolicy);
              },
            ),
            buidlSettingItem(
              title: 'Support',
              icon: Assets.assetsSvgsMail,
              iconColor: AppColors.grey,
              onTap: () {
                Get.toNamed(Get.currentRoute + routeSupport);
              },
            ),
            buidlSettingItem(
              title: 'Logout',
              icon: Assets.assetsSvgsLogout,
              onTap: () {
                Get.dialog(
                  YesNoDialog(
                    icon: Assets.assetsSvgsWarning,
                    title: 'Are you sure you want to Log out?',
                    onYes: () {
                      Get.offAllNamed(routeLogin);
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  GestureDetector buidlSettingItem({
    required String title,
    required String icon,
    Color? iconColor,
    Function()? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: cardDecoration(
          borderRadius: BorderRadius.circular(1.sw),
          color: AppColors.white,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: horizontalSpacing,
          vertical: verticalSpacing * 0.9,
        ),
        margin: EdgeInsets.symmetric(
          horizontal: horizontalSpacing,
          vertical: verticalSpacing * 0.7,
        ),
        child: Row(
          children: [
            MySvg(
              icon,
              width: horizontalSpacing * 1.1,
              color: iconColor,
            ),
            generalSmallBox,
            Text(
              title,
              style: tStyles['black15mid'],
            ),
            const Spacer(),
            Visibility(
              visible: icon != Assets.assetsSvgsLogout,
              child: const Icon(
                CupertinoIcons.forward,
                color: AppColors.grey,
              ),
            )
          ],
        ),
      ),
    );
  }
}
