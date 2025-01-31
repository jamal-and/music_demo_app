import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:music_app/core/controller/user_controller.dart';
import 'package:music_app/general_export.dart';
import 'package:music_app/routes.dart';
import 'package:music_app/ui/screens/main/pages/profile/profile_viewmodel.dart';
import 'package:music_app/ui/widgets/app_bar.dart';
import 'package:music_app/ui/widgets/big_category_item.dart';
import 'package:music_app/ui/widgets/buttons.dart';
import 'package:music_app/ui/widgets/csvg.dart';
import 'package:music_app/ui/widgets/dialogs.dart';
import 'package:music_app/ui/widgets/list_item_widget.dart';
import 'package:music_app/ui/widgets/list_item_with_image.dart';

class ProfielScreen extends StatelessWidget {
  const ProfielScreen({super.key});

  @override
  Widget build(BuildContext context) {
    UserController userController = Get.find<UserController>();
    ProfileViewmodel viewmodel = Get.put(ProfileViewmodel());

    return Container(
      color: AppColors.shapeBackground,
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              CAppBar(
                title: 'Profile',
                actions: [
                  CIconButton(
                    icon: Assets.assetsSvgsMail,
                    onPress: () {},
                  ),
                  generalSmallBox,
                  CIconButton(
                    icon: Assets.assetsSvgsSettings,
                    onPress: () {
                      Get.toNamed(Get.currentRoute + routeSettings);
                    },
                  ),
                ],
              ),
              generalBox,
              Row(
                children: [
                  generalBox,
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          //  viewmodel.pickImages();
                        },
                        child: Container(
                          decoration: circleDecoration(),
                          clipBehavior: Clip.hardEdge,
                          width: 0.2.sw,
                          height: 0.2.sw,
                          child: Image.asset(
                            Assets.assetsImagesLoginBg,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Text(
                        userController.currentUser.name,
                        style: tStyles['black14semi'],
                      ),
                      Text(
                        '@${userController.currentUser.id}',
                        style: tStyles['grey14'],
                      ),
                    ],
                  ),
                  generalBox,
                  generalBox,
                  Expanded(
                    flex: 2,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                decoration:
                                    cardDecoration(color: AppColors.white),
                                padding: generalSmallPadding,
                                child: Column(
                                  children: [
                                    Text(
                                      '100K',
                                      style: tStyles['black14bold'],
                                    ),
                                    Text(
                                      'Followers',
                                      style: tStyles['grey14'],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            generalSmallBox,
                            generalBox,
                            Expanded(
                              child: Container(
                                decoration:
                                    cardDecoration(color: AppColors.white),
                                padding: generalSmallPadding,
                                child: Column(
                                  children: [
                                    Text(
                                      '23',
                                      style: tStyles['black14bold'],
                                    ),
                                    Text(
                                      'Following',
                                      style: tStyles['grey14'],
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                        generalBox,
                        GestureDetector(
                          onTap: () {
                            showCupertinoModalPopup(
                              context: context,
                              builder: (context) {
                                return CupertinoActionSheet(
                                  cancelButton: CupertinoActionSheetAction(
                                    isDefaultAction: true,
                                    onPressed: () {
                                      Get.back();
                                    },
                                    child: const Text('Cancel'),
                                  ),
                                  actions: [
                                    CupertinoActionSheetAction(
                                      onPressed: viewmodel.pickImages,
                                      child: Text(
                                        'From Gallery',
                                        style: tStyles['black16semi'],
                                      ),
                                    ),
                                    CupertinoActionSheetAction(
                                      onPressed: viewmodel.pickImageFromCamer,
                                      child: Text(
                                        'From Camera',
                                        style: tStyles['black16semi'],
                                      ),
                                    )
                                  ],
                                );
                                return const Text('data');
                              },
                            );
                            // showModalBottomSheet(
                            //   context: context,
                            //   builder: (context) {
                            //     return const Text('data');
                            //   },
                            // );
                            //  viewmodel.pickImages();
                          },
                          child: Container(
                            decoration: cardDecoration(color: AppColors.white),
                            padding: generalSmallPadding,
                            width: 1.sw,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                MySvg(
                                  Assets.assetsSvgsUserPlusPerson,
                                  width: 0.05.sw,
                                ),
                                generalSmallBox,
                                Text(
                                  'Uplaod Photos',
                                  style: tStyles['black14semi'],
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  generalBox,
                ],
              ),
              generalBox,
              GetBuilder(builder: (ProfileViewmodel viewmodel) {
                return Container(
                  color: AppColors.white,
                  padding: EdgeInsets.symmetric(horizontal: horizontalSpacing),
                  child: Column(
                    children: [
                      generalBox,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: BigCategoryItem(
                              text: 'Collection',
                              isSelected:
                                  viewmodel.selectedCatogry == 'Collection',
                              onPress: () {
                                viewmodel.setSelectedCatogry('Collection');
                              },
                            ),
                          ),
                          generalSmallBox,
                          Expanded(
                            child: BigCategoryItem(
                              text: 'Playlist',
                              isSelected:
                                  viewmodel.selectedCatogry == 'Playlist',
                              onPress: () {
                                viewmodel.setSelectedCatogry('Playlist');
                              },
                            ),
                          ),
                          generalSmallBox,
                          Expanded(
                            child: BigCategoryItem(
                              isSelected:
                                  viewmodel.selectedCatogry == 'Wishlist',
                              text: 'Wishlist',
                              onPress: () {
                                viewmodel.setSelectedCatogry('Wishlist');
                              },
                            ),
                          ),
                        ],
                      ),
                      generalBox,
                      viewmodel.selectedCatogry == 'Playlist'
                          ? ListView.separated(
                              itemBuilder: (context, index) {
                                return const ListItemWithImage(
                                  title: 'Title and',
                                  subtitle: 'subtitle and',
                                );
                              },
                              separatorBuilder: (context, index) {
                                return generalBox;
                              },
                              itemCount: 9,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              padding: EdgeInsets.symmetric(
                                  vertical: verticalSpacing / 2),
                            )
                          : GetBuilder(builder: (ProfileViewmodel viewmodel) {
                              return GridView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: viewmodel.imagesFiles.isEmpty
                                    ? 8
                                    : viewmodel.imagesFiles.length,
                                shrinkWrap: true,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  childAspectRatio: 0.76,
                                  mainAxisSpacing: verticalSpacing,
                                  crossAxisSpacing: horizontalSpacing,
                                ),
                                itemBuilder: (context, index) {
                                  XFile? image =
                                      viewmodel.imagesFiles.isNotEmpty
                                          ? viewmodel.imagesFiles[index]
                                          : null;
                                  return AnimationConfiguration.staggeredList(
                                    position: index,
                                    child: SlideAnimation(
                                      horizontalOffset: 50,
                                      child: FadeInAnimation(
                                        child: GestureDetector(
                                          onTap: () {
                                            if (image != null) {
                                              Get.dialog(
                                                Dialog(
                                                  clipBehavior: Clip.hardEdge,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                      horizontalSpacing / 2,
                                                    ),
                                                  ),
                                                  child: Container(
                                                    decoration:
                                                        cardDecoration(),
                                                    child: Stack(
                                                      children: [
                                                        Image.file(
                                                          File(image.path),
                                                        ),
                                                        Positioned(
                                                          right:
                                                              horizontalSpacing /
                                                                  2,
                                                          top: verticalSpacing /
                                                              2,
                                                          child: CIconButton(
                                                            icon: CupertinoIcons
                                                                .xmark,
                                                            iconColor:
                                                                AppColors.black,
                                                            backgroundColor:
                                                                AppColors.white
                                                                    .withOpacity(
                                                              0.7,
                                                            ),
                                                            onPress: () {
                                                              Get.back();
                                                            },
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              );
                                            }
                                          },
                                          onLongPress: () {
                                            if (image != null) {
                                              Get.dialog(
                                                YesNoDialog(
                                                  icon:
                                                      Assets.assetsSvgsWarning,
                                                  title:
                                                      'Are you sure want to delete this photo',
                                                  onYes: () {
                                                    viewmodel.onDeletes(image);
                                                  },
                                                ),
                                              );
                                            }
                                          },
                                          child: ListItemWidget(
                                            title: 'Title',
                                            subtitle: 'sss',
                                            imageUrl: (image?.path),
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              );
                            })
                    ],
                  ),
                );
              })
            ],
          ),
        ),
      ),
    );
  }
}
