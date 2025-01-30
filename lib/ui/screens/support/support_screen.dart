import 'package:flutter/material.dart';
import 'package:music_app/general_export.dart';
import 'package:music_app/ui/widgets/app_bar.dart';
import 'package:music_app/ui/widgets/buttons.dart';
import 'package:music_app/ui/widgets/text_input.dart';

class SupportScreen extends StatelessWidget {
  const SupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: MainBottomButton(
        text: 'Send',
        onPress: () {},
      ),
      backgroundColor: AppColors.shapeBackground,
      body: SafeArea(
          child: Column(
        children: [
          const CAppBar(title: 'Support'),
          generalBox,
          Expanded(
            child: SingleChildScrollView(
              padding: generalPadding,
              child: Column(
                children: [
                  const CTextInputWithTitle(
                    title: 'Email',
                    hint: 'your@email.com',
                    backgroundColor: AppColors.white,
                  ),
                  generalBox,
                  const CTextInputWithTitle(
                    title: 'Message',
                    hint: 'Your message here',
                    backgroundColor: AppColors.white,
                    minLines: 6,
                    maxLines: 8,
                  ),
                ],
              ),
            ),
          ),
        ],
      )),
    );
  }
}
