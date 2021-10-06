import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:fluttereitango/pages/testpage/testappvar.dart';

const optionalWords = ["りんご", "ぶどう", "なし", "いちご"];

class optional extends StatelessWidget {
  const optional({Key? key, required this.param}) : super(key: key);

  final Map param;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        OutlinedButton(
          child: Text(
            param["text"],
            style: TextStyle(fontSize: 30),
          ),
          style: OutlinedButton.styleFrom(
              primary: Colors.black,
              shape: const StadiumBorder(),
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
              children: [
                Text(
                  'Tickets',
                  style: TextStyle(
                    color: kColorTextDark,
                    fontSize: 18,
                  ),
                ),
                Icon(Icons.filter_list, color: kColorText),
              ],
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
                  for (var item in optionalWords)
                    optional(param: {"text": item})
                ]),
              ),
            ),
          )
        ],
      ),
    );
  }
}
