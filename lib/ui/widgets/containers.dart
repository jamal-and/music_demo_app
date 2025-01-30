import 'package:flutter/material.dart';
import 'package:music_app/general_export.dart';

class SheetContainer extends StatelessWidget {
  const SheetContainer({
    super.key,
    required this.child,
    this.height,
  });
  final Widget child;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw,
      height: height,
      padding: EdgeInsets.symmetric(
        horizontal: horizontalSpacing,
        vertical: verticalSpacing,
      ),
      decoration: sheetDecoration(
        color: AppColors.background,
        radius: horizontalSpacing * 3,
      ),
      child: child,
    );
  }
}

class HeaderGradient extends StatelessWidget {
  const HeaderGradient({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1.sh * 0.2,
      decoration: const BoxDecoration(
        gradient: AppColors.primaryGradient,
      ),
    );
  }
}
