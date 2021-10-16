import 'package:flutter/material.dart';
import 'package:fluttereitango/icons/part_icon_icons.dart';
import 'package:fluttereitango/pages/listpage/wordlistpage.dart';

import '../../main.dart';

//品詞リスト
//今のところ使わない
List partList = ["全体", "名詞", "動詞", "形容詞", "副詞", "助動詞", "前置詞"];

class _HorizontalBorder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1,
      margin: EdgeInsets.symmetric(horizontal: 16),
      color: Colors.grey[200],
    );
  }
}

class _AppColumn extends StatelessWidget {
  final String name;
  final Icon icon;
  final String percentage;

  const _AppColumn({
    Key? key,
    required this.name,
    required this.icon,
    required this.percentage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => PartWordListPage(name)));
      },
      leading: icon,
      title: Text(
        name,
        style: TextStyle(color: kColorText),
      ),
      trailing: Text(
        percentage,
        style: TextStyle(color: kColorText),
      ),
    );
  }
}

class PartList extends StatelessWidget {
  var child;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Material(
          color: Colors.white,
          elevation: kElevation,
          borderRadius: BorderRadius.circular(16),
          child: Column(
            children: [
              _HorizontalBorder(),
              _AppColumn(
                icon: Icon(Icons.sms, color: Colors.indigo),
                name: '全体',
                percentage: '70%',
              ),
              _HorizontalBorder(),
              _AppColumn(
                icon: Icon(PartIcon.noun, color: Colors.indigo),
                name: '名詞',
                percentage: '75%',
              ),
              _HorizontalBorder(),
              _AppColumn(
                icon: Icon(PartIcon.verb, color: Colors.red),
                name: '動詞',
                percentage: '60%',
              ),
              _HorizontalBorder(),
              _AppColumn(
                icon: Icon(PartIcon.adjective, color: Colors.green),
                name: '形容詞',
                percentage: '35%',
              ),
              _HorizontalBorder(),
              _AppColumn(
                icon: Icon(PartIcon.adverb, color: Colors.orange),
                name: '副詞',
                percentage: '35%',
              ),
              _HorizontalBorder(),
              _AppColumn(
                icon: Icon(PartIcon.Auxiliaryverb, color: Colors.black),
                name: '助動詞',
                percentage: '15%',
              ),
              _HorizontalBorder(),
              _AppColumn(
                icon: Icon(PartIcon.preposition, color: Colors.teal),
                name: '前置詞',
                percentage: '15%',
              ),
            ],
          ),
        ),
      ],
    );
  }
}
