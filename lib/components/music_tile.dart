import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:univates_prova_final/models/music.dart';
import 'package:univates_prova_final/providers/music_provider.dart';

class MusicTile extends StatelessWidget {
  final Music music;

  const MusicTile(this.music, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const avatar = CircleAvatar(
      child: Icon(Icons.music_note),
      backgroundColor: Colors.lightBlue,
      foregroundColor: Colors.white,
    );

    return ListTile(
      leading: avatar,
      title: Text(music.name),
      subtitle: Text('${music.artist} - ${music.album} - ${music.year}'),
      trailing: SizedBox(
        width: 48,
        child: Row(
          children: <Widget>[
            IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('Excluir música'),
                    content: const Text('Deseja realmente excluir a música?'),
                    actions: <Widget>[
                      TextButton(
                        child: const Text('Não'),
                        onPressed: () {
                          Navigator.of(context).pop(false);
                        },
                      ),
                      TextButton(
                        child: const Text('Sim'),
                        onPressed: () {
                          Navigator.of(context).pop(true);
                        },
                      )
                    ],
                  ),
                ).then((deleteConfirmed) {
                  if (deleteConfirmed) {
                    Provider.of<MusicProvider>(context, listen: false)
                        .remove(music);
                  }
                });
              },
              icon: const Icon(Icons.delete),
              color: Colors.red,
            ),
          ],
        ),
      ),
    );
  }
}
