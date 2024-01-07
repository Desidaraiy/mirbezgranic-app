import 'package:intl/intl.dart';
import 'package:mirbezgranic/models/message.dart';
import 'package:mirbezgranic/utils/database_util.dart';
import 'package:sqflite/sqflite.dart';

class LocalMessagesRepository {
  static const String tableName = 'messages';
  late Database database;

  LocalMessagesRepository() {
    initializeDatabase();
  }

  void initializeDatabase() {
    database = DatabaseManager.getInstance();
  }

  Future<List<MessageModel>> getMessages() async {
    try {
      final now = DateTime.now();
      final formattedNow = DateFormat('yyyy-MM-dd').format(now);

      final List<Map<String, dynamic>> result = await database.query(
        tableName,
        orderBy: 'id ASC',
        where: "date <= ?",
        whereArgs: [formattedNow],
      );
      return result.map((row) => MessageModel.fromJson(row)).toList();
    } catch (e) {
      throw DatabaseException('Failed to retrieve messages from database, $e');
    }
  }

  // Future<List<MessageModel>> getMessages() async {
  //   List<MessageModel> messages = [];
  //   String jsonString =
  //       await rootBundle.loadString('assets/json/notifications.json');
  //   List<dynamic> jsonList = json.decode(jsonString)['notifications'];
  //   for (var json in jsonList) {
  //     MessageModel message = MessageModel.fromJson(json);
  //     messages.add(message);
  //   }
  //   return messages;
  // }

  Future<void> insertMessage(MessageModel note) async {
    final Batch batch = database.batch();
    batch.insert(tableName, note.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    try {
      await batch.commit();
    } catch (e) {
      throw DatabaseException('Failed to insert message into database');
    }
  }
}

class DatabaseException implements Exception {
  final String message;

  DatabaseException(this.message);

  @override
  String toString() {
    return 'DatabaseException: $message';
  }
}
