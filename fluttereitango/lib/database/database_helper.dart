import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class Eitango {
  final int? id;
  final String? word;
  final String part;
  final String mean;
  final String pure_mean;
  final String pronunciation;
  final String mean_in_english;
  final String explanation;
  final String example_in_en;
  final String example_in_ja;

  Eitango({
    this.id,
    required this.word,
    required this.part,
    required this.mean,
    required this.pure_mean,
    required this.pronunciation,
    required this.mean_in_english,
    required this.explanation,
    required this.example_in_en,
    required this.example_in_ja,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'word': word,
      'part': part,
      'mean': mean,
      'pure_mean': pure_mean,
      'pronunciation': pronunciation,
      'mean_in_english': mean_in_english,
      'explanation': explanation,
      'example_in_en': example_in_en,
      'example_in_ja': example_in_ja,
    };
  }

  static Future<Database> get database async {
    // openDatabase() データベースに接続
    final Future<Database> _database = openDatabase(
      // getDatabasesPath() データベースファイルを保存するパス取得
      join(await getDatabasesPath(), 'eitango_database.db'),
      onCreate: (db, version) {
        return db.execute(
          // テーブルの作成
          "CREATE TABLE eitango(id INTEGER PRIMARY KEY AUTOINCREMENT, word TEXT, part TEXT, mean TEXT, pure_mean TEXT, pronunciation TEXT, mean_in_english TEXT, explanation TEXT, example_in_en TEXT, example_in_ja TEXT",
        );
      },
      version: 1,
    );
    return _database;
  }

  //データの挿入
  static Future<void> insertEitango(Eitango eitango, {String? word}) async {
    final Database db = await database;
    await db.insert(
      'eitango',
      eitango.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  //データ取得
  static Future<List<Eitango>> getEitangos() async {
    final Database db = await database;
    final List<Map<String, dynamic>> maps = await db.query('eitango');
    return List.generate(maps.length, (i) {
      return Eitango(
        id: maps[i]['id'],
        word: maps[i]['word'],
        part: maps[i]['part'],
        mean: maps[i]['mean'],
        pure_mean: maps[i]['pure_mean'],
        pronunciation: maps[i]['pronunciation'],
        mean_in_english: maps[i]['mean_in_english'],
        explanation: maps[i]['explanation'],
        example_in_en: maps[i]['example_in_en'],
        example_in_ja: maps[i]['example_in_ja'],
      );
    });
  }

  //データのアップデート
  static Future<void> updateEitango(Eitango eitango) async {
    // Get a reference to the database.
    final db = await database;
    await db.update(
      'eitango',
      eitango.toMap(),
      where: "id = ?",
      whereArgs: [eitango.id],
      conflictAlgorithm: ConflictAlgorithm.fail,
    );
  }

  //データの削除
  static Future<void> deleteEitango(int id) async {
    final db = await database;
    await db.delete(
      'eitango',
      where: "id = ?",
      whereArgs: [id],
    );
  }

  //データ全削除
  static Future<void> alldeleteEitango() async {
    final db = await database;
    await db.delete(
      'eitango',
    );
  }
}
