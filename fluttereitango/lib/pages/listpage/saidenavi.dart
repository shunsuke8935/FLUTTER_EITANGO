

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttereitango/icons/part_icon_icons.dart';
import 'package:fluttereitango/pages/toppage/batteryoptimizerpage.dart';

class SideNavigation extends StatefulWidget {
  @override
  _SideNavigationState createState() => _SideNavigationState();
}

class _SideNavigationState extends State<SideNavigation> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return NavigationRail(
      selectedIndex: selectedIndex,
      onDestinationSelected: (index) {
        setState(() {
          selectedIndex = index;
        });
      },
      destinations: [
        NavigationRailDestination(
          icon: IconButton(
            icon: Icon(Icons.arrow_back_outlined),
            onPressed: (){
              Navigator.pop(context, MaterialPageRoute(builder:(context) => BatteryOptimizerPage()));
            },
          ),
          label: Text('ThumbsUpDown'),
        ),
        NavigationRailDestination(
          icon: Icon(PartIcon.noun),
          label: Text('People'),
        ),
        NavigationRailDestination(
          icon: Icon(Icons.face),
          label: Text('Face'),
        ),
        NavigationRailDestination(
          icon: Icon(Icons.bookmark),
          label: Text('Bookmark'),
        ),
      ],
    );
  }
}