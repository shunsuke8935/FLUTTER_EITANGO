import 'package:flutter/material.dart';
import 'package:fluttereitango/pages/listpage/saidenavi.dart';
import 'package:fluttereitango/pages/optionpage/option.dart';
import 'package:fluttereitango/pages/toppage/indicator.dart';
import 'package:flutter/material.dart';
import 'package:fluttereitango/parts/commons.dart';
import 'package:quiver/async.dart';

class count_page extends StatefulWidget {
  count_page(this.part);
  String part;

  @override
  _count_pageState createState() => _count_pageState();
}

class _count_pageState extends State<count_page> {
  // ②カウントを示すインスタンス変数
  int _start = 3;
  int _current = 3;

  // ③ カウントダウン処理を行う関数を定義
  void startTimer() {
    CountdownTimer countDownTimer = new CountdownTimer(
      new Duration(seconds: _start), //初期値
      new Duration(seconds: 1), // 減らす幅
    );

    var sub = countDownTimer.listen(null);
    sub.onData((duration) {
      setState(() {
        _current = _start - duration.elapsed.inSeconds; //毎秒減らしていく
      });
    });

    // ④終了時の処理
    sub.onDone(() {
      print("Done");
      sub.cancel();
      _current = 10;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: backButton(widget.part),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // ⑤現在のカウントを表示
            Text(
              "$_current秒",
              style: Theme.of(context).textTheme.display1,
            ),
            // ⑦カウントダウン関数を実行するボタン
            ElevatedButton(
              onPressed: () {
                startTimer();
              },
              child: Text("start"),
            ),
          ],
        ),
      ),
    );
  }
}
