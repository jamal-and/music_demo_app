import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_app/core/models/bottom_bar_item.dart';
import 'package:music_app/general_export.dart';
import 'package:music_app/ui/screens/main/main_viewmodel.dart';
import 'package:music_app/ui/widgets/containers.dart';
import 'package:music_app/ui/widgets/csvg.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: MainViewmodel(),
      builder: (MainViewmodel viewmodel) {
        return Scaffold(
          bottomNavigationBar: buildBottomBar(viewmodel),
          body: Stack(
            children: [
              const HeaderGradient(),
              PageView(
                controller: viewmodel.pageController,
                physics: const NeverScrollableScrollPhysics(),
                children: viewmodel.pages,
              ),
            ],
          ),
        );
      },
    );
  }

  Container buildBottomBar(MainViewmodel viewmodel) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, -5),
            blurRadius: 10,
            color: AppColors.black.withOpacity(0.06),
          ),
        ],
      ),
      padding: const EdgeInsets.only(top: 0),
      child: SafeArea(
        child: SizedBox(
          height: 1.sh * 0.08,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ...viewmodel.bottomBarItems.map(
                (e) => Expanded(
                  child: GestureDetector(
                    onTap: () {
                      viewmodel.onBottomBarPressed(
                          viewmodel.bottomBarItems.indexOf(e));
                    },
                    child: GetBuilder(builder: (MainViewmodel viewmodel) {
                      return buildBottomNavBarItem(
                        viewmodel.selectedBottomBar == e.label,
                        e,
                      );
                    }),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildBottomNavBarItem(bool isActive, BottomBarItem item) {
    return Align(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: horizontalSpacing / 2),
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
                width: 2,
                color: AppColors.primary,
                style: isActive ? BorderStyle.solid : BorderStyle.none),
          ),
          gradient: isActive
              ? const LinearGradient(
                  colors: [
                    AppColors.gradient1,
                    AppColors.gradient2,
                    // AppColors.gradient2.withOpacity(0)
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [
                    0,
                    0.5,
                    //  1,
                  ],
                )
              : null,
        ),
        child: Column(
          children: [
            generalSmallBox,
            Expanded(
              child: MySvg(
                item.icon,
                color: isActive ? AppColors.black : AppColors.grey,
              ),
            ),
            Text(
              item.label,
              style: tStyles['black14semi']!.copyWith(
                color: isActive ? AppColors.black : AppColors.grey,
              ),
            ),
            generalSmallBox,
          ],
        ),
      ),
    );
  }
}
