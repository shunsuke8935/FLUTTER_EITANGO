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

          //データ作成
          var kakunin = await Eitango.getEitangos();
          print("全権取得------------------");
          print(kakunin);

          //データ挿入
          var memo_ = Eitango(text: "確認", test: "testです");
          Eitango.insertEitango(memo_);

          //データ挿入確認
          var check = await Eitango.getEitangos();
          print("登録後確認-----------------");
          print(check);
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
