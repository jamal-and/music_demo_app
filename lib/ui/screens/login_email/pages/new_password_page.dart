import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:music_app/core/utils/assets.dart';
import 'package:music_app/core/utils/constants.dart';
import 'package:music_app/ui/screens/login_email/email_login_viewmodel.dart';
import 'package:music_app/ui/styles/decorations.dart';
import 'package:music_app/ui/styles/text.dart';
import 'package:music_app/ui/utils/ui_helpers.dart';
import 'package:music_app/ui/widgets/buttons.dart';
import 'package:music_app/ui/widgets/text_input.dart';

class NewPasswordPage extends StatelessWidget {
  const NewPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    EmailLoginViewmodel viewmodel = Get.find();
    return SizedBox(
      height: 1.sh,
      child: SafeArea(
        child: Padding(
          padding: generalPadding,
          child: Form(
            key: viewmodel.newPasswordForm,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CBackButton(
                  onPress: () {
                    viewmodel.onBackPress();
                  },
                ),
                generalBox,
                generalBox,
                Text(
                  'Create new password',
                  style: tStyles['black16'],
                ),
                generalBox,
                generalBox,
                CTextInputWithTitle(
                  title: 'Enter your new password',
                  hint: 'new password',
                  icon: Assets.assetsSvgsLock,
                  isPassword: true,
                  validator: passwordValidator,
                  controller: viewmodel.passworController,
                ),
                generalBox,
                CTextInputWithTitle(
                  title: 'Repeat your new password',
                  hint: 'Repeat new password',
                  icon: Assets.assetsSvgsLock,
                  isPassword: true,
                  validator: viewmodel.repeatPasswordValidator,
                ),
                generalSmallBox,
                const Spacer(),
                FullWidthButton(
                  text: 'Change Password',
                  onPress: () {
                    if (viewmodel.newPasswordForm.currentState!.validate()) {
                      viewmodel.repeatPassworController.clear();
                      viewmodel.updateStep(0);
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
