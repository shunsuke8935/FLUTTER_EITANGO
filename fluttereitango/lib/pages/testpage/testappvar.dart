import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:fluttereitango/pages/listpage/wordlistpage.dart';
import 'package:fluttereitango/pages/testpage/testicon.dart';
import 'package:fluttereitango/pages/testpage/testlist.dart';

const kColorPrimary = Colors.blue;
const kColorText = Color(0xFF9E9E9E);
const kColorTextDark = Color(0xFF212121);
const kColorFlightText = Color(0xFFE0E0E0);
const kColorFlightIcon = Color(0xFFC1B695);
const kColorTicketBorder = Color(0xFFE0E0E0);
const kSingaporeLogoUrl = 'https://user-images.githubusercontent.com/7200238/82220821-1ebc8880-995a-11ea-9d77-07edda64f05c.png';
const kQantasLogoUrl = 'https://user-images.githubusercontent.com/7200238/82220824-1fedb580-995a-11ea-8124-f59daff4ebda.png';
const kEmiratesLogoUrl = 'https://user-images.githubusercontent.com/7200238/82220816-1c5a2e80-995a-11ea-921d-38b3f991d8d2.png';
const kHainanLogoUrl = 'https://user-images.githubusercontent.com/7200238/82223309-73adce00-995d-11ea-98c0-2dba4e094aca.png';

class FlightBookingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.navigate_before, 
            color: Colors.black
            ),
          onPressed: (){            
            Navigator.pop(context, MaterialPageRoute(builder:(context) => AdminMobilePage()));;
        },),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          FlightInfo(),
          TicketList(),
        ],
      ),
    );
  }
}