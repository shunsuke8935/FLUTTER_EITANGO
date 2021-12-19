import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttereitango/pages/listpage/saidenavi.dart';
import 'package:fluttereitango/pages/listpage/wordheader.dart';
import 'package:fluttereitango/pages/listpage/wordlistpage.dart';
import 'package:fluttereitango/pages/testpage/testappvar.dart';
import 'package:fluttereitango/pages/toppage/indicator.dart';
import 'package:fluttereitango/parts/commons.dart';

class OptionPage extends StatefulWidget {
  OptionPage(this.part);
  String part;

  @override
  _OptionPageState createState() => _OptionPageState();
}

class _OptionPageState extends State<OptionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          SideNavigation(),
          VerticalDivider(thickness: 1, width: 1),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              BatteryLevelIndicator_(0.4, 173.0, widget.part),
              optionElement("復習", widget.part),
              optionElement("テスト", widget.part),
              optionElement("習得単語", widget.part),
              optionElement("苦手単語", widget.part),
            ],
          )
        ],
      ),
    );
  }
}

class optionElement extends StatefulWidget {
  optionElement(this.text, this.part);
  String text;
  String part;

  @override
  _optionElementState createState() => _optionElementState();
}

class _optionElementState extends State<optionElement> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 50, right: 50, top: 25),
      child: SizedBox(
        width: 200, //横幅
        height: 60, //高さ
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              onPrimary: Colors.white,
              elevation: 16,
              shape: StadiumBorder(),
              primary: iconColor[widget.part]),
          onPressed: () {
            if (widget.text == "習得単語") {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PartWordListPage(widget.part)));
            }
            if (widget.text == "苦手単語") {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PartWordListPage(widget.part)));
            }
            if (widget.text == "復習") {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => TestPage()));
            }
            if (widget.text == "テスト") {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => TestPage()));
            }
          },
          child: Text(
            widget.text,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}
