import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class Eitango {
  final int? id;
  final String? word;
  final String? part;
  final String? mean;
  final String? pure_mean;
  final String? pronunciation;
  final String? mean_in_english;
  final String? explanation;
  final String? example_in_en;
  final String? example_in_ja;

  Eitango({
    this.id,
    this.word,
    this.part,
    this.mean,
    this.pure_mean,
    this.pronunciation,
    this.mean_in_english,
    this.explanation,
    this.example_in_en,
    this.example_in_ja,
  });

  //返却用の関数
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
    var path = join(await getDatabasesPath(), 'eitango_database.db');

    //データベース削除
    await deleteDatabase(path);

    //データベース削除
    final Future<Database> _database = openDatabase(
      // getDatabasesPath() データベースファイルを保存するパス取得
      path,
      onCreate: (db, version) {
        return db.execute(
          // テーブルの作成
          "CREATE TABLE eitango(id INTEGER PRIMARY KEY AUTOINCREMENT, text TEXT, test Text)",
        );
      },
      version: 1,
    );
    return _database;
  }

  static Future<void> insertEitango(Eitango eitango) async {
    final Database db = await database;
    await db.insert(
      'eitango',
      eitango.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

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

  static Future<void> deleteEitango(int id) async {
    final db = await database;
    await db.delete(
      'eitango',
      where: "id = ?",
      whereArgs: [id],
    );
  }
}
