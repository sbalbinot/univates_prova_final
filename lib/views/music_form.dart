import 'package:univates_prova_final/models/music.dart';
import 'package:univates_prova_final/providers/music_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class MusicForm extends StatefulWidget {
  const MusicForm({Key? key}) : super(key: key);

  @override
  State<MusicForm> createState() => _MusicFormState();
}

class _MusicFormState extends State<MusicForm> {
  final _form = GlobalKey<FormState>();

  final _formData = {};

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    var arguments = ModalRoute.of(context)?.settings.arguments;

    if (arguments != null) {
      final Music music = arguments as Music;
      _loadFormData(music);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Cadastro de Música'),
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: () {
              final isValid = _form.currentState!.validate();
              if (isValid) {
                _form.currentState!.save();
                Provider.of<MusicProvider>(context, listen: false).add(
                  Music(
                    id: _formData['id'],
                    name: _formData['name'],
                    artist: _formData['artist'],
                    album: _formData['album'],
                    year: _formData['year'],
                  ),
                );
                Navigator.of(context).pop();
              }
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Form(
            key: _form,
            child: Column(
              children: [
                TextFormField(
                  initialValue: _formData['name'],
                  decoration: const InputDecoration(labelText: 'Nome'),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'O campo Nome deve ser preenchido.';
                    }
                    return null;
                  },
                  onSaved: (value) => _formData['name'] = value,
                ),
                TextFormField(
                  initialValue: _formData['artist'],
                  decoration: const InputDecoration(labelText: 'Artista'),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'O campo Artista deve ser preenchido.';
                    }
                    return null;
                  },
                  onSaved: (value) => _formData['artist'] = value,
                ),
                TextFormField(
                  initialValue: _formData['album'],
                  decoration: const InputDecoration(labelText: 'Álbum'),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'O campo Álbum deve ser preenchido.';
                    }
                    return null;
                  },
                  onSaved: (value) => _formData['album'] = value,
                ),
                TextFormField(
                  initialValue: _formData['year'],
                  decoration: const InputDecoration(labelText: 'Ano'),
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                  ],
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'O campo Número deve ser preenchido.';
                    } else if (int.parse(value) < 0) {
                      return 'Número deve ser maior que 0.';
                    }
                    return null;
                  },
                  onSaved: (value) => _formData['year'] = int.parse(value!),
                ),
              ],
            )),
      ),
    );
  }

  void _loadFormData(Music music) {
    _formData['id'] = music.id!;
    _formData['name'] = music.name;
    _formData['artist'] = music.artist;
    _formData['album'] = music.album;
    _formData['year'] = music.year;
  }
}
