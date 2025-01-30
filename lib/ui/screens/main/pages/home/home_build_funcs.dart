part of 'home_screen.dart';

extension on _HomeScreenState {
  HorizontalGridWithScrollBar buildTrendingArtists() {
    return HorizontalGridWithScrollBar(
      itemCount: 6,
      height: 1.sh * 0.45,
      scrollController: ScrollController(),
      itemBuilder: (context, index) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                width: 1.sw * 0.4,
                decoration: circleDecoration(),
                clipBehavior: Clip.hardEdge,
                child: Image.asset(
                  Assets.assetsImagesLoginBg,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Text(
              'Keving De',
              style: tStyles['black16semi'],
            ),
            Text(
              'Vancouver, British Columbia',
              style: tStyles['grey12'],
            ),
          ],
        );
      },
    );
  }

  SizedBox buildRotatedBanner() {
    return SizedBox(
      width: 3 * 1.sw,
      height: 1.sw * 0.4,
      child: Stack(
        children: [
          Positioned(
            height: 1.sh * 0.2,
            left: -horizontalSpacing * 2,
            right: -horizontalSpacing * 2,
            child: RotationTransition(
              turns: const AlwaysStoppedAnimation(-7 / 360),
              child: Align(
                child: Container(
                  width: 1.sw * 3,
                  height: 1.sh * 0.06,
                  decoration: const BoxDecoration(
                    color: AppColors.shapeBackgroundDark,
                  ),
                  clipBehavior: Clip.hardEdge,
                  padding: generalSmallPadding,
                  child: GetBuilder(
                    builder: (HomeViewmodel viewmodel) {
                      return ListView.builder(
                        controller: viewmodel.bannerScroll,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          String item = viewmodel
                              .bannerItem[index % viewmodel.bannerItem.length];
                          return buildBannerItem(name: item);
                        },
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Row buildBannerItem({String? imageUrl, required String name}) {
  return Row(
    children: [
      Container(
        decoration: circleDecoration(color: AppColors.white),
        height: 1.sw * 0.1,
        width: 1.sw * 0.1,
        padding: const EdgeInsets.all(2),
        child: Container(
          decoration: circleDecoration(),
          clipBehavior: Clip.hardEdge,
          child: Image.asset(
            Assets.assetsImagesLoginBg,
            fit: BoxFit.cover,
          ),
        ),
      ),
      SizedBox(
        width: horizontalSpacing / 3,
      ),
      Text(
        name,
        style: tStyles['white12mid'],
      ),
      generalBox,
    ],
  );
}

Widget buildRecentPlayedList(HomeViewmodel viewmodel) {
  return HorizontalGridWithScrollBar(
    itemBuilder: (context, index) {
      return const ListItemWithImage(
        title: 'Title and',
        subtitle: 'subtitle and',
      );
    },
    height: (1.sh * 0.15),
    itemCount: 4,
    scrollController: viewmodel.recentScroll,
    childAspectRatio: 0.2,
  );
}

SizedBox buidlCatogriesList(HomeViewmodel viewmodel) {
  return SizedBox(
    height: 1.sh * 0.11,
    child: ListView.separated(
      padding: EdgeInsets.symmetric(horizontal: horizontalSpacing),
      scrollDirection: Axis.horizontal,
      itemCount: viewmodel.categories.length,
      itemBuilder: (context, index) {
        SongCateogry cateogry = viewmodel.categories[index];
        return Container(
          decoration: cardDecoration(),
          clipBehavior: Clip.hardEdge,
          width: 1.sw * 0.41,
          child: Stack(
            children: [
              Image.asset(
                Assets.assetsImagesSignupBg,
                width: 1.sw,
                height: 1.sw,
                fit: BoxFit.cover,
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 1.sh * 0.05,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      end: Alignment.topCenter,
                      begin: Alignment.bottomCenter,
                      colors: [AppColors.black, AppColors.black.withOpacity(0)],
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: generalSmallPadding,
                  child: Text(
                    cateogry.name,
                    style: tStyles['white16semi'],
                  ),
                ),
              )
            ],
          ),
        );
      },
      separatorBuilder: (context, index) {
        return generalSmallBox;
      },
    ),
  );
}

SizedBox buildHomeListView(List list) {
  return SizedBox(
    height: 1.sh * 0.25,
    child: ListView.separated(
      padding: EdgeInsets.symmetric(
        horizontal: horizontalSpacing,
      ),
      scrollDirection: Axis.horizontal,
      itemCount: list.length,
      itemBuilder: (context, index) {
        Song song = list[index];
        return AnimationConfiguration.staggeredList(
          position: index,
          child: SlideAnimation(
            horizontalOffset: 50,
            duration: 500.milliseconds,
            child: FadeInAnimation(
              duration: 500.milliseconds,
              child: GestureDetector(
                onTap: () {
                  Get.toNamed(Get.currentRoute + routeAlbum);
                },
                child: ListItemWidget(
                  imageUrl: song.imageUrl,
                  subtitle: song.artist,
                  title: song.title,
                ),
              ),
            ),
          ),
        );
      },
      separatorBuilder: (context, index) {
        return generalSmallBox;
      },
    ),
  );
}

Padding buildHomeTitle({required String title, bool witIcon = true}) {
  return Padding(
    padding: generalPadding,
    child: Row(
      children: [
        Flexible(
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              title,
              style: tStyles['black20bold'],
              maxLines: 1,
            ),
          ),
        ),
        Visibility(
          visible: witIcon,
          child: const Icon(CupertinoIcons.forward),
        )
      ],
    ),
  );
}

Widget buildHomeHeader() {
  final myUserControler = Get.find<UserController>();
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: horizontalSpacing),
    child: Row(
      children: [
        MySvg(
          Assets.assetsSvgsLogo,
          width: 1.sw * 0.12,
        ),
        generalSmallBox,
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hi, ${myUserControler.currentUser.name} 👋🏻',
                style: tStyles['black18semi'],
              ),
              Text(
                'let’s spin some tracks and vibe out! 🎧',
                style: tStyles['black10'],
              ),
            ],
          ),
        ),
        const CIconButton(icon: Assets.assetsSvgsLock)
      ],
    ),
  );
}

Stack buildPremiumWidget() {
  return Stack(
    children: [
      const Positioned.fill(
        child: MySvg(
          Assets.assetsSvgsPremiumBg,
          fit: BoxFit.fill,
        ),
      ),
      SizedBox(
        width: 1.sw,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            generalBox,
            generalBox,
            const Center(child: MySvg(Assets.assetsSvgsPremiumLogo)),
            generalBox,
            generalSmallBox,
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: horizontalSpacing,
              ),
              child: Text(
                'Unlock Unlimited Access!',
                style: tStyles['white22bold'],
              ),
            ),
            Container(
              width: 0.6.sw,
              padding: EdgeInsets.symmetric(
                horizontal: horizontalSpacing,
              ),
              child: Text(
                'Subscribe today and elevate your experience!',
                style: tStyles['white12'],
              ),
            ),
            generalBox,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalSpacing),
              child: CButton(
                onPress: () {},
                text: 'Subscribe Now',
                color: AppColors.white,
              ),
            ),
            generalBox,
            generalBox,
          ],
        ),
      )
    ],
  );
}
