import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_app/general_export.dart';
import 'package:music_app/ui/widgets/csvg.dart';
import 'package:music_app/ui/widgets/dynamic_icon.dart';

class FullWidthButton extends StatelessWidget {
  const FullWidthButton({
    super.key,
    required this.text,
    this.onPress,
    this.withMargin = false,
    this.color,
  });
  final String text;
  final void Function()? onPress;
  final bool withMargin;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: withMargin ? horizontalSpacing : 0,
      ),
      child: CupertinoButton(
        onPressed: onPress,
        padding: EdgeInsets.zero,
        borderRadius: BorderRadius.circular(
          1.sw,
        ),
        child: AnimatedContainer(
          duration: generalDuration,
          curve: Curves.easeIn,
          height: fullWidthButtonHeight,
          decoration: cardDecoration(
            borderRadius: BorderRadius.circular(
              horizontalSpacing * 0.8,
            ),
            color: onPress == null
                ? AppColors.white.withOpacity(0.1)
                : color ?? AppColors.primary,
          ),
          //color: AppColors.primary,
          child: Center(
            child: Text(
              text,
              style: tStyles['white15bold']!.copyWith(
                  color: onPress == null
                      ? AppColors.textColor.withOpacity(0.4)
                      : AppColors.black),
            ),
          ),
        ),
      ),
    );
  }
}

class CButton extends StatelessWidget {
  const CButton({
    super.key,
    required this.text,
    this.onPress,
    this.color,
    this.icon,
    this.horizontalPadding,
  });
  final String text;
  final void Function()? onPress;
  final Color? color;
  final Widget? icon;
  final double? horizontalPadding;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: onPress,
      padding: EdgeInsets.symmetric(
        vertical: verticalSpacing * 0.8,
        horizontal: horizontalPadding ?? horizontalSpacing * 1.5,
      ),
      borderRadius: BorderRadius.circular(
        1.sw,
      ),
      color: color ?? AppColors.primary,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          icon ?? const SizedBox(),
          icon != null ? generalSmallBox : const SizedBox(),
          Text(
            text,
            style: tStyles['black16bold'],
          ),
        ],
      ),
    );
  }
}

class CiconWithTextButton extends StatelessWidget {
  const CiconWithTextButton({
    super.key,
    required this.text,
    required this.icon,
    this.onPress,
    this.width,
  });
  final String text;
  final dynamic icon; // Can be Widget or IconData or SvgPath
  final Function()? onPress;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: onPress,
      padding: EdgeInsets.zero,
      minSize: 0,
      child: Container(
        width: width,
        decoration: cardDecoration(
          color: Colors.white,
        ),
        padding: generalPadding,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.only(right: horizontalSpacing / 2),
              child: DynamicIcon(
                icon: icon,
              ),
            ),
            Text(
              text,
              style: tStyles['black16semi'],
            ),
            Visibility(
              visible: false,
              child: DynamicIcon(
                icon: icon,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CBackButton extends StatelessWidget {
  const CBackButton({
    super.key,
    this.onPress,
  });
  final Function()? onPress;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: onPress ??
          () {
            Get.back();
          },
      minSize: 0,
      padding: EdgeInsets.zero,
      child: Container(
        decoration: circleDecoration(
          color: AppColors.white,
          withShadow: true,
        ),
        padding: EdgeInsets.all(horizontalSpacing * 0.5),
        child: const Icon(
          CupertinoIcons.back,
          color: AppColors.grey,
        ),
      ),
    );
  }
}

class CIconButton extends StatelessWidget {
  const CIconButton({
    super.key,
    required this.icon,
    this.onPress,
    this.backgroundColor,
    this.iconColor,
  });
  final dynamic icon;
  final Function()? onPress;
  final Color? backgroundColor;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: onPress,
      padding: EdgeInsets.zero,
      minSize: 0,
      child: Container(
        decoration: circleDecoration(
          withShadow: true,
          color: backgroundColor ?? AppColors.white,
        ),
        width: 0.11.sw,
        height: 0.11.sw,
        padding: EdgeInsets.all(0.03.sw),
        child: icon is String
            ? MySvg(
                icon,
                color: iconColor ?? AppColors.grey,
              )
            : icon is IconData
                ? FittedBox(
                    child: Icon(
                      icon,
                      color: iconColor ?? AppColors.grey,
                    ),
                  )
                : icon,
      ),
    );
  }
}

// ********** Bottom Bar Button ************** //
class MainBottomButton extends StatelessWidget {
  const MainBottomButton({
    super.key,
    required this.text,
    this.onPress,
  });
  final String text;
  final Function()? onPress;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: verticalSpacing / 2,
          horizontal: horizontalSpacing,
        ),
        child: FullWidthButton(
          text: text,
          onPress: onPress,
        ),
      ),
    );
  }
}
