import 'dart:math';
import 'package:flutter/material.dart';
import 'package:fluttereitango/pages/testpage/testappvar.dart';
import 'package:fluttereitango/parts/commons.dart';
import '../../main.dart';

class _BatteryLevelIndicatorPainter extends CustomPainter {
  final double percentage; // バッテリーレベルの割合
  final double textCircleRadius; // 内側に表示される白丸の半径
  String part;

  _BatteryLevelIndicatorPainter({
    required this.percentage,
    required this.textCircleRadius,
    required this.part,
  });

  @override
  void paint(Canvas canvas, Size size) {
    for (int i = 1; i < (360 * percentage); i += 5) {
      final per = i / 360.0;
      // 割合（0~1.0）からグラデーション色に変換
      final color = ColorTween(
        begin: iconColor[part],
        end: iconColor[part],
      ).lerp(per)!;
      final paint = Paint()
        ..color = color
        ..style = PaintingStyle.stroke
        ..strokeWidth = 4;

      final spaceLen = 16; // 円とゲージ間の長さ
      final lineLen = 24; // ゲージの長さ
      final angle = (2 * pi * per) - (pi / 2); // 0時方向から開始するため-90度ずらす

      // 円の中心座標
      final offset0 = Offset(size.width * 0.5, size.height * 0.5);
      // 線の内側部分の座標
      final offset1 = offset0.translate(
        (textCircleRadius + spaceLen) * cos(angle),
        (textCircleRadius + spaceLen) * sin(angle),
      );
      // 線の外側部分の座標
      final offset2 = offset1.translate(
        lineLen * cos(angle),
        lineLen * sin(angle),
      );

      canvas.drawLine(offset1, offset2, paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class BatteryLevelIndicator_ extends StatefulWidget {
  BatteryLevelIndicator_(this.percentage, this.size, this.part);
  String part;
  double percentage;
  double size;

  @override
  _BatteryLevelIndicator_State createState() => _BatteryLevelIndicator_State();
}

class _BatteryLevelIndicator_State extends State<BatteryLevelIndicator_> {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _BatteryLevelIndicatorPainter(
          percentage: widget.percentage,
          textCircleRadius: widget.size * 0.5,
          part: widget.part),
      child: Container(
        padding: const EdgeInsets.all(64),
        child: Material(
          color: Colors.white,
          elevation: kElevation,
          borderRadius: BorderRadius.circular(widget.size * 0.5),
          child: Container(
            width: widget.size,
            height: widget.size,
            child: Center(
              child: Text(
                '${widget.percentage * 100}%',
                style: TextStyle(color: iconColor[widget.part], fontSize: 48),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
