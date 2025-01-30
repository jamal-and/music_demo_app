import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_app/general_export.dart';
import 'package:music_app/routes.dart';
import 'package:music_app/ui/screens/login_email/email_login_viewmodel.dart';
import 'package:music_app/ui/screens/login_email/pages/new_password_page.dart';
import 'package:music_app/ui/screens/login_email/pages/otp_page.dart';
import 'package:music_app/ui/utils/ui_helpers.dart';
import 'package:music_app/ui/widgets/buttons.dart';
import 'package:music_app/ui/widgets/containers.dart';
import 'package:music_app/ui/widgets/csvg.dart';
import 'package:music_app/ui/widgets/text_input.dart';

class EmailLoginScreen extends StatelessWidget {
  const EmailLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: 1.sh,
          child: GetBuilder<EmailLoginViewmodel>(
            init: EmailLoginViewmodel(),
            builder: (EmailLoginViewmodel viewmodel) {
              return AnimatedSwitcher(
                duration: 200.milliseconds,
                child: getPage(viewmodel.step, viewmodel),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget getPage(int step, EmailLoginViewmodel viewmodel) {
    switch (step) {
      case 0:
        return buildLogin(viewmodel);
      case 1:
        return buildPassowrRecoveryStepOne(viewmodel);
      case 2:
        return const OtpPage();
      case 3:
        return const NewPasswordPage();
      default:
        return const SizedBox();
    }
  }

  Column buildLogin(EmailLoginViewmodel viewmodel) {
    return Column(
      key: UniqueKey(),
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SafeArea(
          bottom: false,
          child: Padding(
            padding: generalPadding,
            child: const CBackButton(),
          ),
        ),
        generalBox,
        generalBox,
        Center(
          child: MySvg(
            Assets.assetsSvgsLogoDarkText,
            height: 1.sh * 0.2,
          ),
        ),
        generalBox,
        generalBox,
        Expanded(
          child: SheetContainer(
            child: Column(
              children: [
                Text(
                  'Login',
                  style: tStyles['black25semi'],
                ),
                generalBox,
                CTextInputWithTitle(
                  title: 'Email',
                  hint: 'email@mail.com',
                  icon: Assets.assetsSvgsMail,
                  controller: viewmodel.emailController,
                  validator: emailValidator,
                ),
                generalBox,
                const CTextInputWithTitle(
                  title: 'Passwor',
                  hint: 'Enter your password',
                  icon: Assets.assetsSvgsLock,
                  isPassword: true,
                  validator: passwordValidator,
                ),
                generalSmallBox,
                Align(
                  alignment: AlignmentDirectional.centerEnd,
                  child: GestureDetector(
                    onTap: () {
                      viewmodel.updateStep(1);
                    },
                    child: Text(
                      'Forget Password?',
                      style: tStyles['black15bold'],
                    ),
                  ),
                ),
                const Spacer(),
                SafeArea(
                  child: FullWidthButton(
                    text: 'Login',
                    onPress: () {
                      Get.offAllNamed(routeHome);
                    },
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }

  Column buildPassowrRecoveryStepOne(EmailLoginViewmodel viewmodel) {
    return Column(
      key: UniqueKey(),
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SafeArea(
          bottom: false,
          child: Padding(
            padding: generalPadding,
            child: CBackButton(
              onPress: () {
                viewmodel.onBackPress();
              },
            ),
          ),
        ),
        generalBox,
        generalBox,
        Center(
          child: MySvg(
            Assets.assetsSvgsBigColoredLock,
            height: 1.sh * 0.2,
          ),
        ),
        generalBox,
        generalBox,
        Expanded(
          child: SheetContainer(
            child: Form(
              key: viewmodel.recoverEmailForm,
              child: Column(
                children: [
                  Text(
                    'Recover Your Passowrd',
                    style: tStyles['black25semi'],
                  ),
                  generalBox,
                  CTextInputWithTitle(
                    title: 'Email',
                    hint: 'email@mail.com',
                    icon: Assets.assetsSvgsMail,
                    validator: emailValidator,
                    controller: viewmodel.emailController,
                  ),
                  const Spacer(),
                  SafeArea(
                    child: FullWidthButton(
                      text: 'Login',
                      onPress: () {
                        if (viewmodel.recoverEmailForm.currentState!
                            .validate()) {
                          viewmodel.updateStep(2);
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
