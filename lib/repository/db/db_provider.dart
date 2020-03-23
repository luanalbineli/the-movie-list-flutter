import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBProvider {
  DBProvider._();

  static final _dbName = 'movie-database.db';
  static final _dbVersion = 1;
  static final DBProvider db = DBProvider._();

  static const tableNameMovie = 'movie';

  Database _database;

  Future<Database> get database async {
    if (_database == null) {
      _database = await initDB();
    }

    return _database;
  }

  initDB() async {
    String fullDatabasePath = join(await getDatabasesPath(), _dbName);

    return await openDatabase(fullDatabasePath,
        version: _dbVersion,
        onCreate: (Database db, int version) async {
          await db.execute(
              "CREATE TABLE $tableNameMovie ("
                  "id INTEGER NOT NULL, "
                  "poster_path TEXT"
                  "overview TEXT NOT NULL,"
                  "title TEXT NOT NULL,"
                  "vote_average REAL NOT NULL,"
                  "release_date INTEGER,"
                  "backdrop_path TEXT,"
                  "genre_id_list TEXT,"
                  "is_favorite INTEGER,"
                  "is_watched INTEGER,"
                  "PRIMARY KEY(id)"
                  ")"
          );
        });
  }
}