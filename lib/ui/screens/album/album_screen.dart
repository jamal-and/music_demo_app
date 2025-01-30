import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:music_app/core/models/song.dart';
import 'package:music_app/core/utils/assets.dart';
import 'package:music_app/core/utils/constants.dart';
import 'package:music_app/core/utils/global.dart';
import 'package:music_app/routes.dart';
import 'package:music_app/ui/screens/main/pages/home/home_screen.dart';
import 'package:music_app/ui/styles/colors.dart';
import 'package:music_app/ui/styles/decorations.dart';
import 'package:music_app/ui/styles/text.dart';
import 'package:music_app/ui/widgets/buttons.dart';
import 'package:music_app/ui/widgets/csvg.dart';
import 'package:music_app/ui/widgets/dynamic_icon.dart';

class AlbumScreen extends StatelessWidget {
  const AlbumScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 0.47.sh,
              width: 1.sw,
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Image.asset(
                      Assets.assetsImagesLoginBg,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned.fill(
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: const Alignment(0, -1.3),
                          end: const Alignment(0, 0.8),
                          stops: const [0, 1],
                          colors: [
                            AppColors.white.withOpacity(0),
                            AppColors.white,
                          ],
                        ),
                      ),
                    ),
                  ),
                  SafeArea(
                    child: Row(
                      children: [
                        generalBox,
                        CIconButton(
                          icon: CupertinoIcons.back,
                          backgroundColor: AppColors.white.withOpacity(0.4),
                          iconColor: AppColors.white,
                          onPress: () {
                            Get.back();
                          },
                        ),
                        const Spacer(),
                        CIconButton(
                          icon: Icons.more_vert,
                          backgroundColor: AppColors.white.withOpacity(0.4),
                          iconColor: AppColors.white,
                        ),
                        generalBox,
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: Hero(
                        tag: 'Image',
                        child: Container(
                          decoration: cardDecoration(withShadow: true),
                          width: 0.7.sw,
                          height: 0.7.sw,
                          clipBehavior: Clip.hardEdge,
                          child: Image.asset(
                            Assets.assetsImagesLoginBg,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            generalBox,
            buildTitleSection(),
            buildActionsRow(),
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: generalPadding,
              itemBuilder: (context, index) {
                Song song = demoSongs[index];
                return GestureDetector(
                  onTap: () {
                    Get.toNamed(routeHome + routePlayer);
                  },
                  child: Container(
                    color: AppColors.white,
                    child: Row(
                      children: [
                        Text(
                          '${index + 1}',
                          style: tStyles['grey15'],
                        ),
                        generalSmallBox,
                        Text(
                          song.title,
                          style: tStyles['black15mid'],
                        ),
                        const Spacer(),
                        const Icon(
                          CupertinoIcons.star,
                          color: AppColors.grey,
                        ),
                        generalSmallBox,
                        const Icon(
                          Icons.more_vert_outlined,
                          color: AppColors.grey,
                        ),
                      ],
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) => Padding(
                padding: EdgeInsets.only(left: horizontalSpacing),
                child: Divider(
                  height: verticalSpacing * 2,
                  color: AppColors.grey_5,
                ),
              ),
              itemCount: demoSongs.length,
            ),
            generalBox,
            Text(
              '97 Songs, 5 hours, 7 minutes\n14 Nov 2024',
              style: tStyles['grey16'],
              textAlign: TextAlign.center,
            ),
            generalBox,
            buildHomeTitle(title: 'More by Rødhåd'),
            buildHomeListView(demoSongs),
            const SafeArea(
              top: false,
              child: SizedBox(),
            )
          ],
        ),
      ),
    );
  }

  Padding buildActionsRow() {
    return Padding(
      padding: generalPadding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          buildAlbumButton(
            icon: CupertinoIcons.add,
            text: 'Add',
          ),
          buildAlbumButton(
            icon: CupertinoIcons.arrow_down_to_line,
            text: 'Download',
          ),
          buildAlbumButton(
            icon: CupertinoIcons.tag_fill,
            text: 'Buy \$30',
          ),
          buildAlbumButton(
            icon: CupertinoIcons.heart,
            text: 'Wishlist',
          )
        ],
      ),
    );
  }

  Container buildTitleSection() {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            blurRadius: 10,
            offset: const Offset(0, 10),
            color: AppColors.black.withOpacity(0.03),
          ),
        ],
        color: AppColors.white,
      ),
      padding: generalPadding,
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    'Timeless Whisper',
                    style: tStyles['black20bold'],
                  ),
                  generalSmallBox,
                  Text(
                    '2024',
                    style: tStyles['grey12mid'],
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    'Aurora Skies',
                    style: tStyles['black15mid'],
                  ),
                  generalSmallBox,
                  const Icon(
                    CupertinoIcons.forward,
                    size: 15,
                  )
                ],
              ),
            ],
          ),
          const Spacer(),
          const MySvg(Assets.assetsSvgsShuffle),
          generalSmallBox,
          CIconButton(
            icon: Icons.play_arrow,
            backgroundColor: AppColors.primary,
            iconColor: AppColors.black,
            onPress: () {},
          )
        ],
      ),
    );
  }

  Column buildAlbumButton({required String text, required dynamic icon}) {
    return Column(
      children: [
        DynamicIcon(
          icon: icon,
        ),
        Text(
          text,
          style: tStyles['black12mid'],
        )
      ],
    );
  }
}
