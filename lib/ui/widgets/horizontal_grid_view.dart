import 'package:flutter/material.dart';
import 'package:music_app/general_export.dart';

class HorizontalGridWithScrollBar extends StatelessWidget {
  const HorizontalGridWithScrollBar({
    super.key,
    //required this.list,
    required this.scrollController,
    required this.itemBuilder,
    required this.itemCount,
    required this.height,
    this.childAspectRatio,
  });
  // final List list;
  final ScrollController scrollController;
  final Widget Function(BuildContext context, int index) itemBuilder;
  final int itemCount;
  final double height;
  final double? childAspectRatio;

  @override
  Widget build(BuildContext context) {
    ScrollController scrollController = ScrollController();
    return SizedBox(
      height: height + verticalSpacing,
      width: 1.sw,
      child: RawScrollbar(
        thumbColor: AppColors.primary,
        trackColor: AppColors.shapeBackground,
        trackBorderColor: AppColors.shapeBackground,
        thumbVisibility: true,
        controller: scrollController,
        radius: Radius.circular(horizontalSpacing),
        thickness: verticalSpacing / 2.5,
        trackVisibility: true,
        minThumbLength: horizontalSpacing * 2,
        trackRadius: Radius.circular(1.sw),
        padding: EdgeInsets.symmetric(horizontal: 1.sw * 0.4),
        child: Padding(
          padding: EdgeInsets.only(bottom: verticalSpacing * 1.5),
          child: GridView.builder(
            controller: scrollController,
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: horizontalSpacing),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: horizontalSpacing,
              crossAxisSpacing: verticalSpacing,
              childAspectRatio: childAspectRatio ?? 1,
            ),
            itemCount: itemCount,
            itemBuilder: itemBuilder,
          ),
        ),
      ),
    );
  }
}
