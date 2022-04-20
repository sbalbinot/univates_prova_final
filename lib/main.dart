import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:univates_prova_final/database/db.dart';
import 'package:univates_prova_final/providers/music_provider.dart';
import 'package:univates_prova_final/routes/app_routes.dart';
import 'package:univates_prova_final/views/home.dart';
import 'package:univates_prova_final/views/music_form.dart';
import 'package:univates_prova_final/views/music_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => MusicProvider(),
        ),
      ],
      child: MaterialApp(
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [Locale('pt', 'BR')],
        debugShowCheckedModeBanner: false,
        title: 'Cadastro de Músicas',
        theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity),
        routes: {
          AppRoutes.home: (_) => const Home(),
          AppRoutes.musics: (_) => const MusicList(),
          AppRoutes.musicForm: (_) => const MusicForm(),
        },
      ),
    );
  }
}
