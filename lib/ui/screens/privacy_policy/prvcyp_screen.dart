import 'package:flutter/material.dart';
import 'package:music_app/general_export.dart';
import 'package:music_app/ui/widgets/app_bar.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.shapeBackground,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const CAppBar(title: 'Privacy Policy'),
              generalBox,
              const CCollapsWidget(
                title: 'Information We Collect',
                text:
                    '''Personal Information: When you create an account, we may collect personal information such as your name, email address, and payment details.
Usage Data: We collect information about your interactions with the app, including the songs you purchase, playlists you create, and friends you follow.
Device Information: We may collect information about your device, including your IP address, browser type, and operating system.
              ''',
              ),
              const CCollapsWidget(
                title: 'Sharing Your Information',
                text:
                    '''Third-Party Service Providers: We may share your information with third-party vendors that assist us in operating the app and delivering services. These parties are required to protect your information.
Legal Compliance: We may disclose your information if required by law or in response to valid requests by public authorities.
              ''',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CCollapsWidget extends StatelessWidget {
  const CCollapsWidget({
    super.key,
    required this.title,
    required this.text,
  });
  final String title;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: horizontalSpacing, vertical: verticalSpacing / 2),
      clipBehavior: Clip.hardEdge,
      decoration: cardDecoration(withShadow: true, color: AppColors.white),
      child: ExpansionTile(
        title: Text(
          title,
          style: tStyles['black14semi'],
        ),
        backgroundColor: AppColors.white,
        collapsedShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(horizontalSpacing / 2),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(horizontalSpacing / 2),
        ),
        childrenPadding: EdgeInsets.symmetric(horizontal: horizontalSpacing),
        expandedCrossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text,
            style: tStyles['grey14mid'],
          )
        ],
      ),
    );
  }
}
