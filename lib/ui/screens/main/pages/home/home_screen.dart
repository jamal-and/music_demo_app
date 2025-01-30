import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:music_app/core/controller/user_controller.dart';
import 'package:music_app/core/models/cateogry.dart';
import 'package:music_app/core/models/song.dart';
import 'package:music_app/general_export.dart';
import 'package:music_app/routes.dart';
import 'package:music_app/ui/screens/main/pages/home/home_viewmodel.dart';
import 'package:music_app/ui/widgets/big_category_item.dart';
import 'package:music_app/ui/widgets/buttons.dart';
import 'package:music_app/ui/widgets/csvg.dart';
import 'package:music_app/ui/widgets/horizontal_grid_view.dart';
import 'package:music_app/ui/widgets/list_item_widget.dart';
import 'package:music_app/ui/widgets/list_item_with_image.dart';

part 'home_build_funcs.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    HomeViewmodel viewmodel = Get.put(HomeViewmodel());

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              generalSmallBox,
              buildHomeHeader(),
              generalBox,
              GetBuilder(
                builder: (HomeViewmodel viewmodel) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      BigCategoryItem(
                        onPress: () {
                          viewmodel.onHomeChange(true);
                        },
                        text: 'Home',
                        isSelected: viewmodel.isHome,
                        horizontalPadding: horizontalSpacing * 1.5,
                      ),
                      generalBox,
                      BigCategoryItem(
                        onPress: () {
                          viewmodel.onHomeChange(false);
                        },
                        text: 'Following',
                        isSelected: !viewmodel.isHome,
                        horizontalPadding: horizontalSpacing * 1.5,
                      ),
                    ],
                  );
                },
              ),
              GetBuilder(
                builder: (HomeViewmodel viewmodel) {
                  return AnimatedCrossFade(
                    secondChild: Column(
                      // key: UniqueKey(),
                      children: [
                        buildHomeTitle(
                          title: 'New releases from followed artists',
                          witIcon: false,
                        ),
                        buildHomeListView(viewmodel.songs),
                        buildHomeTitle(
                            title: 'Recently Played', witIcon: false),
                        buildRecentPlayedList(viewmodel),
                      ],
                    ),
                    firstChild: Column(
                      //  key: UniqueKey(),
                      children: [
                        buildHomeTitle(title: 'Top Picks'),
                        buildHomeListView(viewmodel.songs),
                        buildHomeTitle(title: 'Fresh Release'),
                        buildHomeListView(viewmodel.songs),
                        buildHomeTitle(title: 'Browse Genres'),
                        buidlCatogriesList(viewmodel),
                        buildHomeTitle(
                            title: 'Recently Played', witIcon: false),
                        buildRecentPlayedList(viewmodel),
                        generalBox,
                        buildRotatedBanner(),
                        buildHomeTitle(title: 'Trending Artists'),
                        buildTrendingArtists(),
                        generalBox,
                        buildPremiumWidget(),
                      ],
                    ),
                    crossFadeState: viewmodel.isHome
                        ? CrossFadeState.showFirst
                        : CrossFadeState.showSecond,
                    duration: 200.milliseconds,
                    // firstCurve: Curves.easeInCirc,
                    // secondCurve: Curves.easeOutCirc,
                  );
                },
              ),
              generalBox,
            ],
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
