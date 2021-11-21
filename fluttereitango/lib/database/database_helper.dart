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

  //データベース作成
  static Future<Database> get database async {
    // openDatabase() データベースに接続
    var path = join(await getDatabasesPath(), 'eitango_database.db');

    //データベース削除
    // await deleteDatabase(path);

    //データベース削除
    final Future<Database> _database = openDatabase(
      // getDatabasesPath() データベースファイルを保存するパス取得
      path,
      onCreate: (db, version) {
        return db.execute(
          // テーブルの作成
          """CREATE TABLE eitango(
            id INTEGER PRIMARY KEY AUTOINCREMENT, 
            word TEXT, 
            part Text, 
            mean Text, 
            pure_mean Text, 
            pronunciation Text, 
            mean_in_english Text, 
            explanation Text, 
            example_in_en Text, 
            example_in_ja Text
            )""",
        );
      },
      version: 1,
    );
    return _database;
  }

  //----------------CREATE-----------------
  //CREATE ONE
  static Future<void> insertEitango(Eitango eitango) async {
    final Database db = await database;
    await db.insert(
      'eitango',
      eitango.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  //CREATE ALL FROM JSON
  static Future<List> insertFromJson(List jsons) async {
    final Database db = await database;
    print(jsons);
    for (var row in jsons) {
      var check_word = await Eitango.checkWord("word", row["word"]);
      if (check_word > 0) {
        print("すでに登録済みのデータ");
      } else {
        print("登録しました。");
        var eitango = Eitango(
            word: row["word"],
            part: row["part"],
            mean: row["mean"],
            pure_mean: row["pure_mean"],
            pronunciation: row["pronunciation"],
            mean_in_english: row["mean_in_english"],
            explanation: row["explanation"],
            example_in_en: row["example_in_en"],
            example_in_ja: row["example_in_ja"]);
        await Eitango.insertEitango(eitango);
      }
    }

    //全権取得
    var result = await getEitangos();
    return result;
  }

  //----------------GET-----------------
  //GET ALL
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

  //GET EXIST RECORD
  static Future<int> checkWord(String column, String word) async {
    final Database db = await database;
    final String sql = 'SELECT count(*) FROM eitango WHERE ${column}="${word}"';
    final List<Map<String, dynamic>> result = await db.rawQuery(sql);
    final word_count = Sqflite.firstIntValue(result);
    var res_int = word_count!.toInt();
    return res_int;
  }

  //GET CUSTOM
  static Future<List<Map<String, dynamic>>> getPartAllWords(
      String column, String value) async {
    final Database db = await database;
    final String sql = "SELECT * FROM eitango WHERE ${column}='${value}'";
    final List<Map<String, dynamic>> result = await db.rawQuery(sql);
    return result;
  }

  //GET RANDOM THREE WORD
  static Future<List<Map<String, dynamic>>> getThreeWords(
      String column, String value) async {
    //品詞の全件取得からランダムな3つを取りだし返却
    final Database db = await database;
    final String sql_random =
        "SELECT id, word, pure_mean FROM eitango WHERE ${column}='${value}' ORDER BY RANDOM() LIMIT 3";
    final List<Map<String, dynamic>> result = await db.rawQuery(sql_random);

    return result;
  }

  //GET CORRECT WORD
  static Future<List<Map<String, dynamic>>> getOneWords(
      String column, String value, String word) async {
    //品詞の全件取得からランダムな3つを取りだし返却
    final Database db = await database;
    final String sql_random =
        "SELECT id, word, pure_mean FROM eitango WHERE ${column}='${value}' and word='${word}'";
    final List<Map<String, dynamic>> result = await db.rawQuery(sql_random);

    return result;
  }

  //----------------UPDATE-----------------
  //UPDATE
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

  //----------------DELETE-----------------
  //DELETE ONE
  static Future<void> deleteEitango(int id) async {
    final db = await database;
    await db.delete(
      'eitango',
      where: "id = ?",
      whereArgs: [id],
    );
  }
}
