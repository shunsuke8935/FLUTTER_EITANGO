import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:fluttereitango/database/database_helper.dart';
import 'package:fluttereitango/pages/testpage/testappvar.dart';
import 'package:fluttereitango/parts/commons.dart';

//回答の選択肢
// ignore: must_be_immutable
class optional extends StatefulWidget {
  optional(this.word, this.part, this.correctword);

  String word;
  String part;
  String correctword;

  @override
  _optionalState createState() => _optionalState();
}

//回答の選択肢
class _optionalState extends State<optional> {
  var status;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 300),
          child: OutlinedButton(
            child: Text(
              //ここ変数
              widget.word,
              style: TextStyle(fontSize: 17),
            ),
            style: OutlinedButton.styleFrom(
              padding: EdgeInsets.all(10),
              primary: Colors.black,
              shape: const StadiumBorder(),
              //ここを変数にする
              side: BorderSide(color: iconColor[widget.part]),
              minimumSize: Size(300, 70),
            ),
            onPressed: () {
              if (widget.correctword == widget.word) {
                print('正解');
                setState(() {
                  status = true;
                });
                TestsItem(widget.part, widget.word);
              } else {
                print('不正解');
              }
            },
          ),
        ),
        SizedBox(
          height: 10,
        )
      ],
    );
  }
}

//テスト画面
class TestsItem extends StatefulWidget {
  TestsItem(this.part, this.word);
  String part;
  String word;

  @override
  _TestsItemState createState() => _TestsItemState();
}

class _TestsItemState extends State<TestsItem> {
  //ダミーデータ
  var dummyWords = [];
  //問題データ
  var words = [];
  //正解データ
  var correctword;
  //問題ステータス
  //0未回答　1正解　2 1不正解
  var status = false;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 24,
              bottom: 8,
              left: 16,
              right: 16,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
            ),
          ),
          Container(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                child: Stack(
                  children: [
                    Column(children: [
                      for (var item in words)
                        optional(item["pure_mean"], widget.part, correctword)
                    ]),
                    Visibility(
                      visible: status,
                      child: Icon(
                        Icons.circle_outlined,
                        color: Colors.red,
                        size: 300,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    getTestWords();
    super.initState();
  }

  Future<void> getTestWords() async {
    var dummyWords = await Eitango.getThreeWords("part", widget.part);
    var correct_word =
        await Eitango.getOneWords("part", widget.part, widget.word);

    //ダミーの三件を回してリストに入れる
    for (var item in dummyWords) {
      words.add(item);
    }

    //正解をリストに格納
    for (var item in correct_word) {
      words.add(item);
      correctword = item['pure_mean'];
    }

    setState(() {
      words = words;
    });
  }
}
