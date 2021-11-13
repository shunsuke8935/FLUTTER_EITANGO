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
