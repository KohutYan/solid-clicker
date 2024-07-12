import 'package:flutter/material.dart';
import 'package:solid_test/app/app.dart';
import 'package:solid_test/l10n/l10n.dart';

class ClickerScreenTitle extends StatelessWidget {
  const ClickerScreenTitle({required this.color, super.key});

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Text(
      context.l10n.clickerScreenTitle,
      style: h1.copyWith(
        color: color,
      ),
    );
  }
}
