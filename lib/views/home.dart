import 'package:flutter/material.dart';
import 'package:univates_prova_final/routes/app_routes.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Página Inicial'),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: TextButton(
                  onPressed: () =>
                      {Navigator.of(context).pushNamed(AppRoutes.musicForm)},
                  child: const Text('Adicionar'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: TextButton(
                  onPressed: () =>
                      {Navigator.of(context).pushNamed(AppRoutes.musics)},
                  child: const Text('Listar'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
