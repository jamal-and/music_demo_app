//******************* Current App Mode *******************//
//*** change current mode when you want to edit mode ***//

import 'package:flutter/material.dart';
import 'package:music_app/core/models/song.dart';
import 'package:music_app/ui/styles/text.dart';

const AppMode currentMode = AppMode.prod;

enum AppMode {
  // Production Mode
  prod,
  // Development Mode
  dev,
  // Demo Mode
  demo,
}

String testImage =
    'https://images.unsplash.com/photo-1512632578888-169bbbc64f33?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1770&q=80';
bool isDark = false;
Map<String, TextStyle> textStyles = AppTextStyles().styles;
bool viewLog = true;
Duration generalAnimationDuration = const Duration(milliseconds: 400);

final List<Song> demoSongs = [
  Song(
    id: '1',
    title: 'Bohemian Rhapsody',
    artist: 'Queen',
  ),
  Song(
    id: '2',
    title: 'Stairway to Heaven',
    artist: 'Led Zeppelin',
  ),
  Song(
    id: '3',
    title: 'Hotel California',
    artist: 'Eagles',
  ),
  Song(
    id: '4',
    title: 'Like a Rolling Stone',
    artist: 'Bob Dylan',
  ),
  Song(
    id: '5',
    title: 'Smells Like Teen Spirit',
    artist: 'Nirvana',
  ),
  Song(
    id: '6',
    title: 'Hey Jude',
    artist: 'The Beatles',
  ),
  Song(
    id: '7',
    title: 'Billie Jean',
    artist: 'Michael Jackson',
  ),
  Song(
    id: '8',
    title: 'Imagine',
    artist: 'John Lennon',
  ),
  Song(
    id: '9',
    title: 'Sweet Child o\' Mine',
    artist: 'Guns N\' Roses',
  ),
  Song(
    id: '10',
    title: 'Rolling in the Deep',
    artist: 'Adele',
  ),
  Song(
    id: '11',
    title: 'Shape of You',
    artist: 'Ed Sheeran',
  ),
  Song(
    id: '12',
    title: 'Someone Like You',
    artist: 'Adele',
  ),
  Song(
    id: '13',
    title: 'Uptown Funk',
    artist: 'Mark Ronson ft. Bruno Mars',
  ),
  Song(
    id: '14',
    title: 'Happy',
    artist: 'Pharrell Williams',
  ),
];
