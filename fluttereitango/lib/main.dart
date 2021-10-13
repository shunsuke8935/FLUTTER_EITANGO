


import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttereitango/pages/toppage/batteryoptimizerpage.dart';

import 'database/database_helper.dart';


const kColorPurple = Color(0xFF8337EC);
const kColorPink = Color(0xFFFF006F);
const kColorIndicatorBegin = kColorPink;
const kColorIndicatorEnd = kColorPurple;
const kColorTitle = Color(0xFF616161);
const kColorText = Color(0xFF9E9E9E);
const kElevation = 4.0;

void main() {
  print('アプリ起動');
  insertAllData();
  runApp(MyApp());
}

//jsonをstringで返す
Future<String> loadAsset() async {
  String res_json = await rootBundle.loadString('json/TSL_EITANGO.json');
  return res_json;
}

//起動時に単語を登録する。
Future<void> insertAllData() async{
  //json取得→map化
  var json_string = await loadAsset();
  List json_datas = json.decode(json_string);

  //json一括登録メソッド
  Eitango.insertFromJson(json_datas);

  //jsonデータ登録確認
  print('登録済み');
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.light().copyWith(
        primaryColor: Colors.white,
        primaryTextTheme: TextTheme(
          headline6: TextStyle(color: kColorTitle),
        ),
        backgroundColor: Colors.white,
      ),

      //バッテリーページ
      home: BatteryOptimizerPage(),
    );
  }
}
