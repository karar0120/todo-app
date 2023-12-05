import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SqliteService {
  static Future<Database> initializeDB() async {
    var databasesPath = await getDatabasesPath();
    return openDatabase(join(databasesPath, 'database.db'), version: 1,
        onCreate: (Database db, int version) async {
      await db.execute(
          'CREATE TABLE task(id INTEGER PRIMARY KEY,title TEXT,description TEXT,time TEXT)');
    });
  }
}
