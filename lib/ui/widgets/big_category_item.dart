import 'package:flutter/cupertino.dart';
import 'package:music_app/general_export.dart';

class BigCategoryItem extends StatelessWidget {
  const BigCategoryItem({
    super.key,
    this.onPress,
    required this.isSelected,
    required this.text,
    this.horizontalPadding = 0,
  });

  final Function()? onPress;
  final bool isSelected;
  final String text;
  final double horizontalPadding;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: () {
        onPress?.call();
      },
      borderRadius: BorderRadius.circular(1.sw),
      color:
          isSelected ? AppColors.primary : CupertinoColors.quaternarySystemFill,
      padding: EdgeInsets.symmetric(
        vertical: verticalSpacing,
        horizontal: horizontalPadding,
      ),
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Text(
          text,
          style: tStyles['black14bold'],
          maxLines: 1,
        ),
      ),
    );
  }
}
