import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solid_test/clicker/bloc/clicker_bloc.dart';
import 'package:solid_test/settings/settings.dart';

class SettingsButton extends StatelessWidget {
  const SettingsButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ClickerBloc, ClickerState>(
      builder: (context, state) {
        return IconButton(
          onPressed: () {
            SettingsView.open(context);
          },
          icon: Icon(
            Icons.settings,
            size: 36,
            color: state.extraColor,
          ),
        );
      },
    );
  }
}
