import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter/material.dart';
import 'package:fluttereitango/database/database_helper.dart';

import '../../main.dart';

class OptimizeNow extends StatelessWidget {
  var word;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 24),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: kColorPurple,
          padding: EdgeInsets.symmetric(horizontal: 48),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
        ),
        onPressed: () async {
          //json取得→map化
          var json_string = await loadAsset();
          List json_datas = json.decode(json_string);

          //json一括登録メソッド
          // Eitango.insertFromJson(json_datas);

          //データ作成
          var kakunin = await Eitango.getEitangos();
          print("全権取得------------------");
          print(kakunin);

          //データ挿入
          var memo_ = Eitango(word: "確認", mean: "testです");
          Eitango.insertEitango(memo_);
        },
        child: Text('Optimize Now', style: TextStyle(color: Colors.white)),
      ),
    );
  }

  //jsonをstringで返す
  Future<String> loadAsset() async {
    String res_json = await rootBundle.loadString('json/TSL_EITANGO.json');
    return res_json;
  }
}
