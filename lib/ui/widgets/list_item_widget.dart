import 'dart:io';

import 'package:flutter/material.dart';
import 'package:music_app/general_export.dart';

class ListItemWidget extends StatelessWidget {
  const ListItemWidget({
    super.key,
    required this.title,
    required this.subtitle,
    this.imageUrl,
  });

  final String title;
  final String subtitle;
  final String? imageUrl;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 1.sw * 0.41,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              decoration: cardDecoration(),
              clipBehavior: Clip.hardEdge,
              child: imageUrl != null
                  ? Image.file(
                      File(
                        imageUrl!,
                      ),
                      width: 1.sw,
                      height: 1.sw,
                      fit: BoxFit.cover,
                    )
                  : Image.asset(
                      Assets.assetsImagesLoginBg,
                      width: 1.sw,
                      height: 1.sw,
                      fit: BoxFit.cover,
                    ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: horizontalSpacing / 4,
              vertical: verticalSpacing / 4,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: tStyles['black16semi'],
                  maxLines: 1,
                ),
                Text(
                  subtitle,
                  style: tStyles['grey12'],
                  maxLines: 1,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
