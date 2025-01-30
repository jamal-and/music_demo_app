import 'package:flutter/material.dart';
import 'package:music_app/general_export.dart';
import 'package:music_app/ui/widgets/buttons.dart';

class CAppBar extends StatelessWidget {
  const CAppBar({
    super.key,
    required this.title,
    this.actions,
    this.onBackPressed,
  });
  final String title;
  final List<Widget>? actions;
  final Function()? onBackPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: verticalSpacing / 2),
      child: Row(
        children: [
          generalBox,
          CBackButton(
            onPress: onBackPressed,
          ),
          generalSmallBox,
          Text(
            title,
            style: tStyles['black20semi'],
          ),
          const Spacer(),
          if (actions != null) ...actions!,
          generalBox,
        ],
      ),
    );
  }
}
