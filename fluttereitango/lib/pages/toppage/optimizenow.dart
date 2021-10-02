import 'package:flutter/material.dart';
import 'package:fluttereitango/database/database_helper.dart';

import '../../main.dart';

class OptimizeNow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 24),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: kColorPurple,
          padding: EdgeInsets.symmetric(horizontal: 48),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
        ),
        onPressed: () async {
          Memo _memo = Memo(text: 'テスト', id: 3);
          final List<Memo> memos = await Memo.getMemos();
          print(memos[0].id);
          print(memos);
        },
        child: Text('Optimize Now', style: TextStyle(color: Colors.white)),
      ),
    );
  }
}
