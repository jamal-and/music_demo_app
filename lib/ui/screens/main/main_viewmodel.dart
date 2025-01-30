import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_app/core/models/bottom_bar_item.dart';
import 'package:music_app/general_export.dart';
import 'package:music_app/ui/screens/main/pages/home/home_screen.dart';
import 'package:music_app/ui/screens/main/pages/home/home_viewmodel.dart';
import 'package:music_app/ui/screens/main/pages/library/library_screen.dart';
import 'package:music_app/ui/screens/main/pages/profile/profiel_screen.dart';
import 'package:music_app/ui/screens/main/pages/search/search_screen.dart';

class MainViewmodel extends GetxController {
  String selectedBottomBar = 'Home';
  List<BottomBarItem> bottomBarItems = [
    BottomBarItem(icon: Assets.assetsSvgsHome, label: 'Home'),
    BottomBarItem(icon: Assets.assetsSvgsSearch, label: 'Search'),
    BottomBarItem(icon: Assets.assetsSvgsDisc, label: 'My Library'),
    BottomBarItem(icon: Assets.assetsSvgsPersonUser, label: 'Profile'),
  ];
  List<Widget> pages = [
    const HomeScreen(),
    const SearchScreen(),
    const MyLibraryScreen(),
    const ProfielScreen(),
  ];

  PageController pageController = PageController();
  onBottomBarPressed(int index) {
    selectedBottomBar = bottomBarItems[index].label;
    pageController.jumpToPage(index);
    update();
    if (index == 0) {
      Get.find<HomeViewmodel>().scrollAnimate();
      update();
    }
    //else {
    //   Get.find<HomeViewmodel>().onHomeOff();
    //   Future.delayed(
    //     200.milliseconds,
    //     () => update(),
    //   );
    // }
  }
}
