import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttereitango/database/database_helper.dart';
import 'package:fluttereitango/icons/part_icon_icons.dart';
import 'package:fluttereitango/pages/testpage/testappvar.dart';

// ignore: must_be_immutable
class _IconColor extends StatelessWidget {
  _IconColor(this.part);
  String part;

  Map iconColor = {
    "名詞": Colors.blue,
    "動詞": Colors.blue,
    "形容詞": Colors.blue,
    "副詞": Colors.blue,
    "助動詞": Colors.blue,
    "前置詞": Colors.blue
  };

  @override
  Widget build(BuildContext context) {
    return iconColor[part];
  }
}

class _PartIcon extends StatelessWidget {
  _PartIcon(this.part);
  String part;
  Map partIcon = {
    "名詞": Icon(
      PartIcon.noun,
    ),
    "動詞": Icon(
      PartIcon.verb,
    ),
    "形容詞": Icon(
      PartIcon.adjective,
    ),
    "副詞": Icon(
      PartIcon.adverb,
    ),
    "助動詞": Icon(
      PartIcon.Auxiliaryverb,
    ),
    "前置詞": Icon(
      PartIcon.preposition,
    )
  };

  @override
  Widget build(BuildContext context) {
    return partIcon[part];
  }
}

class _PostsHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            flex: 1,
            child: ListTile(
                leading: ClipOval(
                  child: Container(
                    color: Colors.grey[300],
                    width: 48,
                    height: 48,
                    child: Center(
                        child: Icon(
                      Icons.border_color,
                      color: Colors.grey[800],
                    )),
                  ),
                ),
                title: Text("テスト"),
                onTap: () {
                  Navigator.of(context).push(
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) {
                        return FlightBookingPage();
                      },
                      transitionsBuilder:
                          (context, animation, secondaryAnimation, child) {
                        final Offset begin = Offset(0.0, 1.0); // 下から上
                        // final Offset begin = Offset(0.0, -1.0); // 上から下
                        final Offset end = Offset.zero;
                        final Animatable<Offset> tween =
                            Tween(begin: begin, end: end)
                                .chain(CurveTween(curve: Curves.easeInOut));
                        final Animation<Offset> offsetAnimation =
                            animation.drive(tween);
                        return SlideTransition(
                          position: offsetAnimation,
                          child: child,
                        );
                      },
                    ),
                  );
                })),
        Expanded(
          flex: 1,
          child: ListTile(
            leading: ClipOval(
              child: Container(
                color: Colors.grey[300],
                width: 48,
                height: 48,
                child: Center(
                  child: Icon(
                    Icons.search,
                    color: Colors.grey[800],
                  ),
                ),
              ),
            ),
            title: Text('検索'),
            onTap: () {
              showDialog(
                context: context,
                builder: (context) {
                  return SimpleDialog(
                    title: Text("検索"),
                    children: <Widget>[
                      // コンテンツ領域
                      SimpleDialogOption(
                        onPressed: () => Navigator.pop(context),
                        child: Text("１項目目"),
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}

class _Post extends StatelessWidget {
  final String name;
  final String message;
  final String textReason;
  final Color colorPrimary;
  final Color colorPositive;
  final String textPositive;
  final Color colorNegative;
  final String textNegative;
  final String part;

  const _Post(
      {Key? key,
      required this.name,
      required this.message,
      required this.textReason,
      required this.colorPrimary,
      required this.colorPositive,
      required this.textPositive,
      required this.colorNegative,
      required this.textNegative,
      required this.part})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Card(
        elevation: 8,
        shadowColor: Colors.grey,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: [
            ListTile(
              leading: ClipOval(
                child: Container(
                  //ここにカラーを返却するクラス配置
                  color: _IconColor(part),
                  width: 48,
                  height: 48,
                  //受け取った品詞によって表示するアイコンを変える
                  //ここにクラスを配置して引数にpartを受け取り適切なアイコンを表示する。
                  child: Center(child: _PartIcon(part)),
                ),
              ),
              title: Text(name),
              subtitle: Text('2 min ago'),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(width: 72),
                  Container(
                    width: 16,
                    height: 16,
                    decoration: BoxDecoration(
                      border: Border.all(color: colorPrimary, width: 4),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  SizedBox(width: 8),
                  Flexible(child: Text(message)),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(color: colorPrimary, width: 2),
                      ),
                    ),
                    child: Text(
                      textReason,
                      style: TextStyle(color: Colors.blueAccent),
                    ),
                  ),
                  SizedBox(width: 24),
                  Expanded(
                    child: TextButton(
                      style: TextButton.styleFrom(
                        primary: colorNegative,
                      ),
                      onPressed: () {},
                      child: Text(textNegative),
                    ),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: TextButton(
                      style: TextButton.styleFrom(
                        primary: colorPositive,
                        backgroundColor: colorPositive.withOpacity(0.2),
                      ),
                      onPressed: () {},
                      child: Text(textPositive),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PostGreen extends StatelessWidget {
  _PostGreen(this.word, this.part);
  String word;
  String part;

  @override
  Widget build(BuildContext context) {
    return _Post(
      //ここにfirestoreから取得した英単語を入れる
      name: word,
      //ここに例文を入れる
      message: 'I have an Apple',
      textReason: 'Report Details',
      colorPrimary: Colors.blueAccent,
      colorPositive: Colors.blueAccent,
      textPositive: 'NO',
      colorNegative: Colors.blueAccent,
      textNegative: 'OK',
      part: part,
    );
  }
}

class PostList extends StatefulWidget {
  PostList(this.part);
  String part;

  @override
  _PostListState createState() => _PostListState();
}

class _PostListState extends State<PostList> {
  var partList = [];

  @override
  Widget build(BuildContext context) {
    print(partList);
    return Container(
      padding: EdgeInsets.only(top: 48),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          _PostsHeader(),
          Expanded(
              child: ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              return _PostGreen(partList[index]["word"], widget.part);
            },
            itemCount: partList.length,
          ))
        ],
      ),
    );
  }

  @override
  void initState() {
    getPartEitango(widget.part);
    super.initState();
  }

  Future<void> getPartEitango(part) async {
    var eitangoLists = await Eitango.getPartAllWords("part", part);
    setState(() {
      partList = eitangoLists;
    });
  }
}
