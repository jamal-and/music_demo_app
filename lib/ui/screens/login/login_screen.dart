import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_app/general_export.dart';
import 'package:music_app/routes.dart';
import 'package:music_app/ui/widgets/buttons.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundDark,
      body: Column(
        children: [
          buildHeaderImageWithText(),
          generalBox,
          CiconWithTextButton(
            text: 'Sign in with Google',
            icon: Assets.assetsSvgsGoogle,
            width: 1.sw * 0.7,
          ),
          generalBox,
          CiconWithTextButton(
            text: 'Sign in with Apple',
            icon: Assets.assetsSvgsApple,
            width: 1.sw * 0.7,
          ),
          generalBox,
          CiconWithTextButton(
            text: 'Sign in with e-mail',
            icon: Assets.assetsSvgsMail,
            width: 1.sw * 0.7,
            onPress: () {
              Get.toNamed(routeEmailLogin);
            },
          ),
          generalBox,
          buildSignUpText(),
        ],
      ),
    );
  }

  CupertinoButton buildSignUpText() {
    return CupertinoButton(
      onPressed: () {
        Get.toNamed(routeSignup);
      },
      child: RichText(
        text: TextSpan(
          text: 'Or ',
          style: tStyles['white15mid'],
          children: [
            TextSpan(
              text: 'Sign up',
              style: tStyles['white15semi']!.copyWith(
                decoration: TextDecoration.underline,
              ),
            ),
            const TextSpan(text: ' here')
          ],
        ),
      ),
    );
  }

  Stack buildHeaderImageWithText() {
    return Stack(
      children: [
        Image.asset(
          Assets.assetsImagesLoginBg,
          height: 1.sh * 0.62,
          width: 1.sw,
          fit: BoxFit.cover,
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Lets get started 🎧',
                  style: tStyles['white32semi'],
                ),
                Text(
                  'Please login to continue',
                  style: tStyles['white16'],
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
