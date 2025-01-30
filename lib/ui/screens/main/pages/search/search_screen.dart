import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:music_app/core/models/song.dart';
import 'package:music_app/general_export.dart';
import 'package:music_app/ui/screens/main/pages/search/search_viewmodel.dart';
import 'package:music_app/ui/widgets/big_category_item.dart';
import 'package:music_app/ui/widgets/csvg.dart';
import 'package:music_app/ui/widgets/list_item_with_image.dart';
import 'package:music_app/ui/widgets/text_input.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SearchViewmodel viewmodel = Get.find<SearchViewmodel>();
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            generalBox,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalSpacing),
              child: Text(
                'Search',
                style: tStyles['black22semi'],
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
              builder: (SearchViewmodel viewmodel) {
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
            GetBuilder(
              builder: (SearchViewmodel viewmodel) {
                return viewmodel.getSearchedList().isEmpty
                    ? SizedBox(
                        height: 0.6.sh,
                        child: Center(
                          child: Text(
                            'No results!',
                            style: tStyles['grey16'],
                          ),
                        ),
                      )
                    : ListView.separated(
                        padding: generalPadding,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          Song song = viewmodel.getSearchedList()[index];
                          return AnimationConfiguration.staggeredList(
                            position: index,
                            child: SlideAnimation(
                              horizontalOffset: 50,
                              child: FadeInAnimation(
                                child: ListItemWithImage(
                                  title: song.title,
                                  subtitle: song.artist,
                                  withIcon: false,
                                ),
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) => generalBox,
                        itemCount: viewmodel.getSearchedList().length,
                        shrinkWrap: true,
                      );
              },
            ),
          ],
        ),
      ),
    );
  }
}
