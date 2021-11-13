import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:fluttereitango/pages/testpage/testappvar.dart';

const optionalWords = ["りんご", "ぶどう", "なし", "いちご"];

// class optional extends StatelessWidget {
//   const optional({Key? key, required this.param}) : super(key: key);

//   final Map param;

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         OutlinedButton(
//           child: Text(
//             //ここ変数
//             param["text"],
//             style: TextStyle(fontSize: 30),
//           ),
//           style: OutlinedButton.styleFrom(
//               primary: Colors.black,
//               shape: const StadiumBorder(),
//               //ここを変数にする
//               side: const BorderSide(color: Colors.blue),
//               minimumSize: Size(300, 70)),
//           onPressed: () {},
//         ),
//         SizedBox(
//           height: 10,
//         )
//       ],
//     );
//   }
// }

class optional extends StatefulWidget {
  optional(this.part, this.word);

  String part;
  String word;

  @override
  _optionalState createState() => _optionalState();
}

class _optionalState extends State<optional> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        OutlinedButton(
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
              minimumSize: Size(300, 70)),
          onPressed: () {},
        ),
        SizedBox(
          height: 10,
        )
      ],
    );
  }
}

//このstatufulwidgetを適用させる。単語を受け取りqueryに投げる
class TicketList extends StatelessWidget {
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
                  for (var item in optionalWords) optional("名詞", item)
                ]),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class TestsItem extends StatefulWidget {
  TestsItem({Key? key}) : super(key: key);

  @override
  _TestsItemState createState() => _TestsItemState();
}

class _TestsItemState extends State<TestsItem> {
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
                  for (var item in optionalWords) optional("名詞", item)
                ]),
              ),
            ),
          )
        ],
      ),
    );
  }
}
