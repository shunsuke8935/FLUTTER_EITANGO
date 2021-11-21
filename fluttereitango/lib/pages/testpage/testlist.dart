import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:fluttereitango/database/database_helper.dart';
import 'package:fluttereitango/pages/testpage/testappvar.dart';

class optional extends StatefulWidget {
  optional(this.word);

  String word;

  @override
  _optionalState createState() => _optionalState();
}

class _optionalState extends State<optional> {
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
              style: TextStyle(fontSize: 30),
            ),
            style: OutlinedButton.styleFrom(
              primary: Colors.black,
              shape: const StadiumBorder(),
              //ここを変数にする
              side: const BorderSide(color: Colors.blue),
              minimumSize: Size(300, 70),
            ),
            onPressed: () {},
          ),
        ),
        SizedBox(
          height: 10,
        )
      ],
    );
  }
}

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
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                child: Column(children: [
                  for (var item in words) optional(item["pure_mean"])
                ]),
              ),
            ),
          )
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
    var dummyWords = await Eitango.getThreeWords("part", "名詞");
    var correct_word = await Eitango.getOneWords("part", "名詞", "apple");

    //ダミーの三件を回してリストに入れる
    for (var item in dummyWords) {
      words.add(item);
    }

    //正解をリストに格納
    for (var item in correct_word) {
      words.add(item);
    }

    setState(() {
      words = words;
    });
  }
}
