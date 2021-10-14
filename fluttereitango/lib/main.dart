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
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
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

  @override
  void initState() {
    super.initState();
    print("起動");
    saveJsonDate();
  }

  //jsonからデータを全て登録する
  Future<void> saveJsonDate() async {
    var json_string = await loadAsset();
    List json_datas = json.decode(json_string);
    Eitango.insertFromJson(json_datas);
  }

  //jsonをstringで返す
  Future<String> loadAsset() async {
    String res_json = await rootBundle.loadString('json/TSL_EITANGO.json');
    return res_json;
  }
}

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Flutter Demo',
//       theme: ThemeData.light().copyWith(
//         primaryColor: Colors.white,
//         primaryTextTheme: TextTheme(
//           headline6: TextStyle(color: kColorTitle),
//         ),
//         backgroundColor: Colors.white,
//       ),

//       //バッテリーページ
//       home: BatteryOptimizerPage(),
//     );
//   }
// }
