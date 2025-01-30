import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:music_app/core/models/song.dart';
import 'package:music_app/general_export.dart';
import 'package:music_app/ui/screens/main/pages/library/library_viewmodel.dart';
import 'package:music_app/ui/widgets/big_category_item.dart';
import 'package:music_app/ui/widgets/buttons.dart';
import 'package:music_app/ui/widgets/csvg.dart';
import 'package:music_app/ui/widgets/list_item_widget.dart';
import 'package:music_app/ui/widgets/text_input.dart';

class MyLibraryScreen extends StatelessWidget {
  const MyLibraryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    LibraryViewmodel viewmodel = Get.put(LibraryViewmodel());
    return Scaffold(
      backgroundColor: Colors.transparent,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        shape: const CircleBorder(),
        backgroundColor: AppColors.primary,
        elevation: 0,
        child: const Icon(
          Icons.play_arrow,
          size: 40,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              generalSmallBox,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: horizontalSpacing),
                child: Row(
                  children: [
                    Text(
                      'My Library',
                      style: tStyles['black22semi'],
                    ),
                    const Spacer(),
                    const CIconButton(icon: Icons.add),
                    generalSmallBox,
                    const CIconButton(icon: Icons.more_vert)
                  ],
                ),
              ),
              Padding(
                padding: generalPadding,
                child: Material(
                  elevation: 8,
                  shadowColor: AppColors.black.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(horizontalSpacing / 2),
                  child: CustomTextInput(
                    textEditingController: viewmodel.searchController,
                    onChange: (v) {
                      viewmodel.update();
                    },
                    hint: 'Search',
                    customTextStyle: tStyles['black16mid'],
                    customPadding: EdgeInsets.symmetric(
                      vertical: verticalSpacing / 2,
                      horizontal: horizontalSpacing,
                    ),
                    customBackground: AppColors.white,
                    suffix: Padding(
                      padding: generalSmallPadding,
                      child: const MySvg(Assets.assetsSvgsSearch),
                    ),
                  ),
                ),
              ),
              GetBuilder(
                builder: (LibraryViewmodel viewmodel) {
                  return SizedBox(
                    height: verticalSpacing * 3,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      padding:
                          EdgeInsets.symmetric(horizontal: horizontalSpacing),
                      itemBuilder: (context, index) {
                        String tite = viewmodel.cateogries[index];
                        return BigCategoryItem(
                          isSelected: index == viewmodel.selectedIndex,
                          horizontalPadding: horizontalSpacing * 2,
                          text: tite,
                          onPress: () {
                            viewmodel.setSelectedIndex(index);
                          },
                        );
                      },
                      separatorBuilder: (context, index) {
                        return generalSmallBox;
                      },
                      itemCount: viewmodel.cateogries.length,
                    ),
                  );
                },
              ),
              GetBuilder(builder: (LibraryViewmodel viewmodel) {
                return viewmodel.getSearchedList().isEmpty
                    ? SizedBox(
                        height: 0.6.sp,
                        child: Center(
                          child: Text(
                            'No results!',
                            style: tStyles['grey16'],
                          ),
                        ),
                      )
                    : GridView.builder(
                        shrinkWrap: true,
                        itemCount: viewmodel.getSearchedList().length,
                        physics: const NeverScrollableScrollPhysics(),
                        padding: generalPadding,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: verticalSpacing,
                          crossAxisSpacing: horizontalSpacing,
                          childAspectRatio: 0.7,
                        ),
                        itemBuilder: (context, index) {
                          Song song = viewmodel.getSearchedList()[index];
                          return AnimationConfiguration.staggeredGrid(
                            position: index,
                            duration: const Duration(milliseconds: 200),
                            delay: const Duration(milliseconds: 100),
                            columnCount: 2,
                            child: SlideAnimation(
                              child: FadeInAnimation(
                                child: ListItemWidget(
                                  title: song.title,
                                  subtitle: song.artist,
                                ),
                              ),
                            ),
                          );
                        },
                      );
              })
            ],
          ),
        ),
      ),
    );
  }
}
