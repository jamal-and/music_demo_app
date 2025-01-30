import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:music_app/core/models/song.dart';
import 'package:music_app/core/utils/global.dart';

class SearchViewmodel extends GetxController {
  TextEditingController searchController = TextEditingController();
  int selectedIndex = 0;
  final List cateogries = ['Grlaish', 'Doku', 'Kevin'];

  List<Song> getSearchedList() {
    return demoSongs.where(
      (element) {
        return element.title
                .toLowerCase()
                .contains(searchController.text.toLowerCase()) ||
            element.artist
                .toLowerCase()
                .contains(searchController.text.toLowerCase());
      },
    ).toList();
  }

  setSelectedIndex(int index) {
    selectedIndex = index;
    update();
  }
}
