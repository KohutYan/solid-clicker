import 'package:flutter/material.dart';
import 'package:solid_test/clicker/clicker.dart';

class ClickerView extends StatelessWidget {
  const ClickerView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(
        children: [
          ClickableField(),
          Positioned(
            left: 16,
            child: SafeArea(
              child: ShareButton(),
            ),
          ),
          Positioned(
            right: 16,
            child: SafeArea(
              child: SettingsButton(),
            ),
          ),
        ],
      ),
    );
  }
}
