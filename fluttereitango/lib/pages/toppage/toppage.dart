import 'package:flutter/material.dart';

import 'apps.dart';
import 'indicator.dart';
import 'optimizenow.dart';
import 'optimizerbutton.dart';

class TopPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: Text('Battery Optimizer'),
        centerTitle: false,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            OptimizerButtons(),
            BatteryLevelIndicator_(0.1, 173.0, "全体"),
            PartList(),
            OptimizeNow(),
          ],
        ),
      ),
    );
  }
}
