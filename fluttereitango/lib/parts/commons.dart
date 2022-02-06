import 'package:flutter/material.dart';
import 'package:fluttereitango/pages/listpage/wordlistpage.dart';

//アイコンのカラー
Map iconColor = {
  "全体": Colors.pink,
  "名詞": Colors.blue,
  "動詞": Colors.red,
  "形容詞": Colors.green,
  "副詞": Colors.orange,
  "助動詞": Colors.black,
  "前置詞": Colors.greenAccent
};

//戻るボタンの共通
class backButton extends StatefulWidget with PreferredSizeWidget {
  backButton(this.part);
  String part;

  @override
  _backButtonState createState() => _backButtonState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class _backButtonState extends State<backButton> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      leading: IconButton(
        icon: Icon(Icons.navigate_before, color: Colors.black),
        onPressed: () {
          Navigator.pop(
              context,
              MaterialPageRoute(
                  builder: (context) => PartWordListPage("no param")));
          ;
        },
      ),
      backgroundColor: iconColor[widget.part],
    );
  }
}
