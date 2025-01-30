import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_app/core/utils/global.dart';
import 'package:music_app/general_export.dart';
import 'package:music_app/ui/screens/main/pages/home/home_screen.dart';
import 'package:music_app/ui/widgets/buttons.dart';

class ArtistScreen extends StatelessWidget {
  const ArtistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Image.asset(
                  Assets.assetsImagesLoginBg,
                  height: 0.4.sh,
                  width: 1.sw,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  bottom: 0,
                  child: Container(
                    width: 1.sw,
                    height: 0.2.sh,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          AppColors.black.withOpacity(0),
                          AppColors.black.withOpacity(0.7),
                        ],
                        begin: const Alignment(0, -1),
                        end: Alignment.bottomCenter,
                      ),
                    ),
                  ),
                ),
                SafeArea(
                  bottom: false,
                  child: Padding(
                    padding: generalPadding,
                    child: Row(
                      children: [
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
                          icon: CupertinoIcons.add,
                          backgroundColor: AppColors.white.withOpacity(0.4),
                          iconColor: AppColors.white,
                        ),
                        generalSmallBox,
                        CIconButton(
                          icon: Icons.more_vert,
                          backgroundColor: AppColors.white.withOpacity(0.4),
                          iconColor: AppColors.white,
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: verticalSpacing,
                  left: horizontalSpacing / 2,
                  right: horizontalSpacing / 2,
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(
                                'The Traveler’s Tune',
                                style: tStyles['white21semi'],
                              ),
                            ),
                            FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(
                                'Los Angeles, California',
                                style: tStyles['grey12'],
                              ),
                            ),
                          ],
                        ),
                      ),
                      generalBox,
                      CIconButton(
                        icon: Assets.assetsSvgsPlay,
                        onPress: () {},
                        backgroundColor: AppColors.primary,
                        iconColor: AppColors.black,
                      ),
                      generalBox,
                      const CiconWithTextButton(
                        text: 'Follow',
                        icon: Assets.assetsSvgsUserPlusPerson,
                      )
                    ],
                  ),
                ),
              ],
            ),
            buildHomeTitle(title: 'Top Songs'),
            buildRecentPlayedList(Get.find()),
            buildHomeTitle(title: 'Albums'),
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
}
