import 'package:flutter/material.dart';
import 'package:music_app/general_export.dart';

class ListItemWithImage extends StatelessWidget {
  const ListItemWithImage({
    super.key,
    this.imageUrl,
    this.withIcon = true,
    this.titleColor,
    required this.title,
    required this.subtitle,
  });
  final String? imageUrl;
  final String title;
  final String subtitle;
  final bool withIcon;
  final Color? titleColor;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          decoration: cardDecoration(),
          width: 1.sw * 0.15,
          height: 1.sw * 0.15,
          clipBehavior: Clip.hardEdge,
          child: Image.asset(
            Assets.assetsImagesLoginBg,
            width: 1.sw,
            height: 1.sw,
            fit: BoxFit.cover,
          ),
        ),
        generalSmallBox,
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: tStyles['black14semi']!.copyWith(color: titleColor),
                maxLines: 1,
              ),
              Text(
                subtitle,
                maxLines: 1,
                style: tStyles['grey14'],
              ),
            ],
          ),
        ),
        Visibility(
          visible: withIcon,
          child: const Icon(
            Icons.more_vert,
            color: AppColors.grey,
          ),
        )
      ],
    );
  }
}
