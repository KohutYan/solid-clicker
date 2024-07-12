import 'package:flutter/material.dart';
import 'package:solid_test/app/app.dart';

class ClicksCounter extends StatelessWidget {
  const ClicksCounter({
    required this.count,
    required this.color,
    super.key,
  });

  final int count;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Text(
      count.toString(),
      style: h2.copyWith(color: color.withOpacity(0.5)),
    );
  }
}
