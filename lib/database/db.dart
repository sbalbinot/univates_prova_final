import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:univates_prova_final/models/music.dart';

class DBHelper {
  // static const tableName = 'music';
  // sql.Database db;

  // DBHelper() {
  //   // this will run when provider is instantiate the first time
  //   init();
  // }

  // void init() async {
  //   final dbPath = await sql.getDatabasesPath();
  //   db = await sql.openDatabase(
  //     path.join(dbPath, 'musics.db'),
  //     onCreate: (db, version) {
  //       final stmt = '''CREATE TABLE IF NOT EXISTS $tableName (
  //           id INTEGER PRIMARY KEY AUTOINCREMENT,
  //           name TEXT NOT NULL,
  //           artist TEXT NOT NULL,
  //           album TEXT NOT NULL,
  //           year INTEGER NOT NULL
  //       )'''
  //           .trim()
  //           .replaceAll(RegExp(r'[\s]{2,}'), ' ');
  //       return db.execute(stmt);
  //     },
  //     version: 1,
  //   );
  //   notifyListeners();
  // }

  Future<Database> initializeDB() async {
    String path = await getDatabasesPath();
    return openDatabase(
      join(path, 'musics.db'),
      onCreate: (database, version) async {
        await database.execute(
          "CREATE TABLE music(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT NOT NULL, artist TEXT NOT NULL, album TEXT NOT NULL, year INTEGER NOT NULL)",
        );
      },
      version: 1,
    );
  }

  Future<int> insertMusic(Music music) async {
    int result = 0;
    final Database db = await initializeDB();
    result = await db.insert('music', music.toMap());
    return result;
  }

  Future<List<Music>> retrieveMusics() async {
    final Database db = await initializeDB();
    final List<Map<String, Object?>> queryResult = await db.query('music');
    return queryResult.map((e) => Music.fromMap(e)).toList();
  }

  Future<void> deleteMusic(int id) async {
    print(id);
    Database db = await initializeDB();
    await db.delete('music', where: 'id = ?', whereArgs: [id]);
  }
}
