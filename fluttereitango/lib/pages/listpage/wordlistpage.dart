import 'package:flutter/material.dart';
import 'package:fluttereitango/database/database_helper.dart';
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
// class PartWordListPage extends StatelessWidget {
//   //遷移前ページから引数を受け取りイニシャライザ
//   PartWordListPage(this.part_name);
//   String part_name;

//   @override
//   Widget build(BuildContext context) {
//     print(part_name);
//     var list = getdatas();
//     return Scaffold(
//       body: Row(
//         children: [
//           SideNavigation(),
//           VerticalDivider(thickness: 1, width: 1),
//           Expanded(
//             child: PostList(),
//           ),
//         ],
//       ),
//     );
//   }

// Future<List> getdatas() async {
//   var result_list = await Eitango.getEitangos();
//   return result_list;
// }
// }

class PartWordListPage extends StatefulWidget {
  PartWordListPage(this.part_name);
  String part_name;

  @override
  _PartWordListPageState createState() => _PartWordListPageState();
}

class _PartWordListPageState extends State<PartWordListPage> {
  @override
  Widget build(BuildContext context) {
    print(widget.part_name);
    return Scaffold(
      body: Row(
        children: [
          SideNavigation(),
          VerticalDivider(thickness: 1, width: 1),
          Expanded(
            child: PostList(widget.part_name),
          ),
        ],
      ),
    );
  }
}
