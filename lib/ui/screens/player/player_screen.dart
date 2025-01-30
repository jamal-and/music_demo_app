import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:music_app/core/utils/assets.dart';
import 'package:music_app/core/utils/constants.dart';
import 'package:music_app/routes.dart';
import 'package:music_app/ui/screens/player/player_viewmodel.dart';
import 'package:music_app/ui/styles/colors.dart';
import 'package:music_app/ui/styles/decorations.dart';
import 'package:music_app/ui/styles/text.dart';
import 'package:music_app/ui/widgets/buttons.dart';
import 'package:music_app/ui/widgets/dynamic_icon.dart';
import 'package:music_app/ui/widgets/list_item_with_image.dart';

class PlayerScreen extends StatelessWidget {
  const PlayerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    PlayerViewmodel viewmodel = Get.put(PlayerViewmodel());
    return Scaffold(
      backgroundColor: AppColors.backgroundDark,
      body: Stack(
        children: [
          SizedBox(
            height: 1.sh,
            width: 1.sw,
          ),
          Image.asset(
            Assets.assetsImagesLoginBg,
            width: 1.sw,
            height: 0.3.sh,
            fit: BoxFit.cover,
          ),
          Container(
            width: 1.sw,
            height: 0.3.sh,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppColors.backgroundDark.withOpacity(0.2),
                  AppColors.backgroundDark,
                ],
                begin: const Alignment(0, -1.6),
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              width: 1.sw,
              height: 0.3.sh,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    const Color(0xff1A0C31).withOpacity(0),
                    const Color(0xff1A0C31),
                  ],
                  begin: const Alignment(0, -1),
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
          ),
          Positioned.fill(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SafeArea(
                    bottom: false,
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: verticalSpacing),
                      child: Row(
                        children: [
                          generalBox,
                          CIconButton(
                            icon: CupertinoIcons.back,
                            backgroundColor: AppColors.white.withOpacity(0.3),
                            iconColor: AppColors.white,
                            onPress: () {
                              Get.back();
                            },
                          ),
                          const Spacer(),
                          CIconButton(
                            icon: CupertinoIcons.add,
                            backgroundColor: AppColors.white.withOpacity(0.3),
                            iconColor: AppColors.white,
                          ),
                          generalSmallBox,
                          CIconButton(
                            icon: Icons.more_vert,
                            backgroundColor: AppColors.white.withOpacity(0.3),
                            iconColor: AppColors.white,
                          ),
                          generalBox,
                        ],
                      ),
                    ),
                  ),
                  generalSmallBox,
                  Hero(
                    tag: 'Image',
                    child: Container(
                      decoration: cardDecoration(withShadow: true),
                      width: 0.85.sw,
                      height: 0.85.sw,
                      clipBehavior: Clip.hardEdge,
                      child: Image.asset(
                        Assets.assetsImagesLoginBg,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  generalBox,
                  Padding(
                    padding: generalPadding,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Radiant Reverie',
                              style: tStyles['white20bold'],
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.toNamed(routeHome + routeArtist);
                              },
                              child: Text(
                                'Luminous Dreams',
                                style: tStyles['grey14mid'],
                              ),
                            ),
                          ],
                        ),
                        const DynamicIcon(
                          icon: Icon(
                            CupertinoIcons.star,
                            size: 30,
                            color: AppColors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: horizontalSpacing * 0.7,
                      vertical: verticalSpacing * 0.3,
                    ),
                    child: SliderTheme(
                      data: SliderThemeData(
                        thumbShape:
                            const RoundSliderThumbShape(enabledThumbRadius: 7),
                        overlayShape: SliderComponentShape.noOverlay,
                      ),
                      child: GetBuilder(builder: (PlayerViewmodel viewmodel) {
                        return Slider(
                          value: viewmodel.getCurrentProgress(),
                          onChanged: viewmodel.onSliderChanged,
                        );
                      }),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: horizontalSpacing),
                    child: GetBuilder(builder: (PlayerViewmodel viewmodel) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${viewmodel.currentDuration.inMinutes.toString().padLeft(2, '0')}:${(viewmodel.currentDuration.inSeconds % 60).toString().padLeft(2, '0')}',
                            style: tStyles['grey12'],
                          ),
                          Text(
                            '${viewmodel.fullDuration.inMinutes.toString().padLeft(2, '0')}:${(viewmodel.fullDuration.inSeconds % 60).toString().padLeft(2, '0')}',
                            style: tStyles['grey12'],
                          )
                        ],
                      );
                    }),
                  ),
                  Padding(
                    padding: generalPadding,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const DynamicIcon(
                          icon: Assets.assetsSvgsShuffle,
                          color: AppColors.white,
                        ),
                        const DynamicIcon(
                          icon: Assets.assetsSvgsPlayPrevious,
                          color: AppColors.white,
                        ),
                        GetBuilder(
                          builder: (PlayerViewmodel viewmodel) {
                            return AnimatedSwitcher(
                              duration: const Duration(milliseconds: 300),
                              switchInCurve: Curves.easeOutCubic,
                              switchOutCurve: Curves.easeInCubic,
                              transitionBuilder: (child, animation) =>
                                  ScaleTransition(
                                scale: animation,
                                child: child,
                              ),
                              child: viewmodel.isPlaying
                                  ? GestureDetector(
                                      key: const Key('pause'),
                                      onTap: () {
                                        viewmodel.onPause();
                                      },
                                      child: const DynamicIcon(
                                        icon: Assets.assetsSvgsPause,
                                      ),
                                    )
                                  : GestureDetector(
                                      key: const Key('play'),
                                      onTap: () {
                                        viewmodel.onPlay();
                                      },
                                      child: const DynamicIcon(
                                        icon: Assets.assetsSvgsPlay,
                                      ),
                                    ),
                            );
                          },
                        ),
                        const DynamicIcon(
                          icon: Assets.assetsSvgsPlayNext,
                          color: AppColors.white,
                        ),
                        const DynamicIcon(
                          icon: Assets.assetsSvgsRepeatLoop,
                          color: AppColors.white,
                        ),
                      ],
                    ),
                  ),
                  generalSmallBox,
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: horizontalSpacing),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Up Next',
                          style: tStyles['white15semi'],
                        ),
                        Text(
                          'Queue',
                          style: tStyles['white15semi'],
                        ),
                      ],
                    ),
                  ),
                  generalBox,
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: horizontalSpacing),
                    child: const ListItemWithImage(
                      title: 'Echoes of the Past',
                      subtitle: 'New Jazz Undergrou..',
                      titleColor: AppColors.white,
                      withIcon: false,
                    ),
                  ),
                  const SafeArea(
                    top: false,
                    child: SizedBox(),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
