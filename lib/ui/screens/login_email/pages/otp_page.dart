import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:music_app/general_export.dart';
import 'package:music_app/ui/screens/login_email/email_login_viewmodel.dart';
import 'package:music_app/ui/widgets/buttons.dart';
import 'package:pinput/pinput.dart';

class OtpPage extends StatelessWidget {
  const OtpPage({super.key});

  @override
  Widget build(BuildContext context) {
    EmailLoginViewmodel viewmodel = Get.find();
    return SizedBox(
      height: 1.sh,
      child: SafeArea(
        child: Padding(
          padding: generalPadding,
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
                'Please enter the OTP that has been sent to your email.',
                style: tStyles['black16'],
              ),
              Text(
                viewmodel.emailController.text,
                style: tStyles['black16smei'],
              ),
              generalBox,
              Pinput(
                controller: viewmodel.otpController,
                onChanged: (value) {
                  viewmodel.update();
                },
                separatorBuilder: (index) {
                  return generalBox;
                },
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                defaultPinTheme: PinTheme(
                  width: 1.sw * 0.2,
                  height: 1.sw * 0.2,
                  decoration: cardDecoration(
                    borderRadius: BorderRadius.circular(horizontalSpacing),
                  ),
                  textStyle: tStyles['black18semi'],
                ),
              ),
              const Spacer(),
              GetBuilder(builder: (EmailLoginViewmodel viewModel) {
                return FullWidthButton(
                  text: 'Continue',
                  onPress: viewmodel.otpController.text.length < 4
                      ? null
                      : () {
                          viewmodel.updateStep(3);
                        },
                );
              })
            ],
          ),
        ),
      ),
    );
  }
}
