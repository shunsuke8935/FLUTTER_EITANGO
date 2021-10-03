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
          //jsonfileを読み込んでjsonstringで返却する。

          // var json_string = await loadAsset();
          // List json_datas = json.decode(json_string);
          // print(json_datas[0]);

          //----データ全取得
          // var memos = await Eitango.getEitangos();
          // print(memos);
          // var satabase = await Eitango.database;
          // var entango = Eitango(
          //     word: "test",
          //     part: "part",
          //     mean: "mean",
          //     pure_mean: "pure_mean",
          //     pronunciation: "pronunciation",
          //     mean_in_english: "mean_in_english",
          //     explanation: "explanation",
          //     example_in_en: "example_in_en",
          //     example_in_ja: "example_in_ja");
          // Eitango.insertEitango(entango);

          //----データ全削除
          // Eitango.alldeleteEitango();
          // var check_memo = await Eitango.getEitangos();
          // print(check_memo);
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
