import 'package:flutter/material.dart';
import 'package:fluttereitango/pages/listpage/saidenavi.dart';
import 'package:fluttereitango/pages/listpage/wordlistpage.dart';
import 'package:fluttereitango/pages/optionpage/option.dart';
import 'package:fluttereitango/pages/testpage/testappvar.dart';
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
        //0秒は更新しないように
        if (_current != 1) {
          _current = _start - duration.elapsed.inSeconds; //毎秒減らしていく
        }
        print(_current);
      });
    });

    sub.onDone(() {
      print("Done");
      sub.cancel();
      Future.delayed(Duration(milliseconds: 2), () {
        print('0.2秒後に開始される。');
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => TestPage_(widget.part)));
      });
    });
  }

  @override
  void initState() {
    super.initState();
    print('initstate');
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // ⑤現在のカウントを表示
            Text(
              "$_current",
              style: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 300,
                color: Colors.blueGrey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
