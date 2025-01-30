import 'package:flutter/material.dart';
import 'package:music_app/core/utils/constants.dart';
import 'package:music_app/ui/styles/colors.dart';

BoxDecoration cardDecoration({
  Color? color,
  BorderRadius? borderRadius,
  bool withShadow = false,
}) =>
    BoxDecoration(
      color: color ?? AppColors.shapeBackground,
      boxShadow: withShadow
          ? [
              BoxShadow(
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                  color: AppColors.black.withOpacity(0.1))
            ]
          : null,
      borderRadius:
          borderRadius ?? BorderRadius.circular(horizontalSpacing / 2),
    );
BoxDecoration circleDecoration({
  Color? color,
  bool withShadow = false,
}) =>
    BoxDecoration(
      color: color ?? AppColors.shapeBackground,
      shape: BoxShape.circle,
      boxShadow: withShadow
          ? [
              BoxShadow(
                blurRadius: 16,
                // spreadRadius: 2,
                offset: const Offset(0, 4),
                color: AppColors.black.withOpacity(0.08),
              )
            ]
          : null,
    );

BoxDecoration sheetDecoration({
  Color? color,
  double? radius,
}) =>
    BoxDecoration(
        color: color ?? AppColors.shapeBackground,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(radius ?? horizontalSpacing),
        ),
        boxShadow: [
          BoxShadow(
            blurRadius: 20,
            offset: const Offset(0, -4),
            color: AppColors.black.withOpacity(0.06),
          )
        ]);

SizedBox generalBox = SizedBox(
  height: verticalSpacing,
  width: horizontalSpacing,
);

SizedBox generalSmallBox = SizedBox(
  height: verticalSpacing / 2,
  width: horizontalSpacing / 2,
);

SizedBox bottomNavBox = SizedBox(
  height: verticalSpacing * 5,
);
