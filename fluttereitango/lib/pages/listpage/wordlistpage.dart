import 'package:flutter/material.dart';
import 'package:fluttereitango/pages/listpage/saidenavi.dart';
import 'package:fluttereitango/pages/listpage/wordheader.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.light(),
      home: PartWordListPage("no param"),
    );
  }
}

//各品詞ページ
class PartWordListPage extends StatelessWidget {
  //遷移前ページから引数を受け取りイニシャライザ
  PartWordListPage(this.test);
  String test;

  @override
  Widget build(BuildContext context) {
    print(test);
    return Scaffold(
      body: Row(
        children: [
          SideNavigation(),
          VerticalDivider(thickness: 1, width: 1),
          Expanded(
            child: PostList(),
          ),
        ],
      ),
    );
  }
}
