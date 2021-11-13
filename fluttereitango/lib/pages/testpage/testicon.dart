import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fluttereitango/pages/testpage/testappvar.dart';

class FlightInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Material(
          color: kColorPrimary,
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
                    '20/2',
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
