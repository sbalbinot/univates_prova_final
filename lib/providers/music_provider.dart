import 'package:univates_prova_final/database/db.dart';
import 'package:univates_prova_final/models/music.dart';
import 'package:flutter/material.dart';

class MusicProvider with ChangeNotifier {
  final dbHelper = DBHelper();
  List<Music> _musics = [];

  MusicProvider() {
    fetchAndSetData();
  }

  List<Music> get musics => [..._musics];

  int get count {
    return _musics.length;
  }

  Music byIndex(int i) {
    return _musics.elementAt(i);
  }

  void add(Music music) {
    dbHelper.initializeDB().whenComplete(() async {
      int id = await dbHelper.insertMusic(music);
      _musics.add(Music(
          id: id,
          name: music.name,
          artist: music.artist,
          album: music.album,
          year: music.year));
      notifyListeners();
    });
  }

  void remove(Music music) {
    dbHelper.initializeDB().whenComplete(() async {
      await dbHelper.deleteMusic(music.id!);
      _musics.removeWhere((m) => m.id == music.id);
      notifyListeners();
    });
  }

  Future<void> fetchAndSetData() async {
    dbHelper.initializeDB().whenComplete(() async {
      _musics = await dbHelper.retrieveMusics();
      notifyListeners();
    });
  }
}
