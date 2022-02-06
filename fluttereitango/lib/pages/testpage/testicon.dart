import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fluttereitango/pages/testpage/testappvar.dart';
import 'package:fluttereitango/parts/commons.dart';

class TestHead extends StatefulWidget {
  TestHead(this.part);
  String part;

  @override
  _TestHeadState createState() => _TestHeadState();
}

class _TestHeadState extends State<TestHead> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Material(
          color: iconColor[widget.part],
          elevation: 24,
          shadowColor: kColorPrimary,
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(24),
            bottomLeft: Radius.circular(24),
          ),
          child: Padding(
            padding: const EdgeInsets.only(
              left: 24,
              right: 24,
              top: 16,
              bottom: 32,
            ),
            child: Column(
              children: [
                Text(
                  "Apple",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 50,
                      color: Colors.white),
                ),
                SizedBox(height: 32),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '10/1',
                    style: TextStyle(color: kColorFlightText.withOpacity(0.5)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
