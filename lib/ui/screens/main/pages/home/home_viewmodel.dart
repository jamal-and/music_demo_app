import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_app/core/models/cateogry.dart';
import 'package:music_app/core/models/song.dart';

class HomeViewmodel extends GetxController {
  bool isHome = true;
  ScrollController recentScroll = ScrollController();
  ScrollController bannerScroll = ScrollController();
  List<Song> songs = [
    Song(
      title: 'Velvet Dreams',
      artist: 'Artist',
    ),
    Song(
      title: 'New Song',
      artist: 'Marina',
    ),
    Song(
      title: 'O song',
      artist: 'Jack',
    ),
  ];

  List<SongCateogry> categories = [
    SongCateogry(imageUrl: '', name: 'Hip Hop'),
    SongCateogry(imageUrl: '', name: 'Jazz'),
    SongCateogry(imageUrl: '', name: 'Gralish'),
  ];

  List<String> bannerItem = [
    'Jack',
    'Gralish',
    'Doku',
    'Kevin',
    'Magdalena Bay'
  ];

  onHomeChange(bool isHomePressed) {
    if (isHome != isHomePressed) {
      isHome = isHomePressed;
      if (isHome) {
        onHomeBack();
      } else {
        onHomeOff();
      }
    }
  }

  onHomeBack() {
    bannerScroll = ScrollController();
    bannerScroll.addListener(scrollListener);
    update();
    Future.delayed(
      20.milliseconds,
      () {
        scrollAnimate();
      },
    );
  }

  onHomeOff() {
    bannerScroll.dispose();
    bannerScroll.removeListener(scrollListener);
    Future.delayed(
      20.milliseconds,
      () {
        update();
      },
    );
  }

  scrollAnimate() async {
    try {
      bannerScroll.animateTo(
        bannerScroll.offset + 200,
        duration: 10.seconds,
        curve: Curves.linear,
      );
    } catch (e) {
      print(e);
    }
  }

  Timer? timer;
  scrollListener() {
    timer?.cancel();
    timer = Timer(
      20.milliseconds,
      () {
        scrollAnimate();
      },
    );
  }

  @override
  void onReady() {
    super.onReady();
    scrollAnimate();
    bannerScroll.addListener(scrollListener);
  }

  @override
  void dispose() {
    super.dispose();
    bannerScroll.removeListener(scrollListener);
  }
}
