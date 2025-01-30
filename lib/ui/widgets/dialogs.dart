import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_app/general_export.dart';
import 'package:music_app/ui/widgets/buttons.dart';
import 'package:music_app/ui/widgets/dynamic_icon.dart';

class YesNoDialog extends StatelessWidget {
  const YesNoDialog({
    super.key,
    required this.icon,
    required this.title,
    this.onYes,
    this.onNo,
  });
  final dynamic icon;
  final String title;
  final Function()? onYes;
  final Function()? onNo;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColors.white,
      title: DynamicIcon(icon: icon),
      content: Text(
        title,
        style: tStyles['black16semi'],
        textAlign: TextAlign.center,
      ),
      //     titlePadding: EdgeInsets.zero,
      actionsAlignment: MainAxisAlignment.spaceBetween,
      contentPadding: EdgeInsets.symmetric(
        horizontal: horizontalSpacing * 2,
        vertical: verticalSpacing,
      ),
      actions: [
        Row(
          children: [
            Expanded(
              child: CButton(
                text: 'No',
                horizontalPadding: 0,
                color: AppColors.shapeBackground,
                onPress: () {
                  if (onNo != null) {
                    onNo!.call();
                  } else {
                    Get.back();
                  }
                },
              ),
            ),
            generalBox,
            Expanded(
              child: CButton(
                text: 'Yes',
                horizontalPadding: 0,
                onPress: () {
                  onYes?.call();
                },
              ),
            ),
          ],
        )
      ],
      insetPadding: generalPadding,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          horizontalSpacing * 2,
        ),
      ),
    );
  }
}
