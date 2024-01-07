import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:flutter/services.dart';

class DatabaseManager {
  static late Database _database;

  static Future<void> initialize() async {
    try {
      String databasesPath = await getDatabasesPath();
      String path = join(databasesPath, 'mirbezgranic.db');
      _database = await openDatabase(
        path,
        version: 1,
        onCreate: _initDb,
      );
      await _initDb(_database, 1);
    } catch (e, stackTrace) {
      print('Ошибка при инициализации базы данных: $e');
      print(stackTrace);
    }
  }

  static Future<void> _initDb(Database db, int version) async {
    String createScript = await _readSqlScript('assets/sql/sql.sql');
    List<String> queries = createScript.split(';');
    for (String query in queries) {
      if (query.trim().isNotEmpty) {
        await db.execute(query);
      }
    }
  }

  static Future<String> _readSqlScript(String filePath) async {
    String content;
    try {
      content = await rootBundle.loadString(filePath);
    } catch (e) {
      print('error while reading sql script: $e');
      content = '';
    }
    return content;
  }

  static Database getInstance() {
    return _database;
  }
}
