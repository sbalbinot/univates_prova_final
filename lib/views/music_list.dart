import 'package:univates_prova_final/components/music_tile.dart';
import 'package:univates_prova_final/providers/music_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MusicList extends StatelessWidget {
  const MusicList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MusicProvider musics = Provider.of(context);

    return Scaffold(
        appBar: AppBar(
          title: const Text('Lista de Músicas'),
        ),
        body: ListView.builder(
          itemCount: musics.count,
          itemBuilder: (context, i) => MusicTile(musics.byIndex(i)),
        ));
  }
}
