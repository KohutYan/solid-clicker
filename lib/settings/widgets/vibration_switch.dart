import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solid_test/settings/settings.dart';

class VibrationSwitch extends StatelessWidget {
  const VibrationSwitch({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsBloc, SettingsState>(
      builder: (context, state) {
        if (state is! SettingsLoadedState) {
          return const SizedBox.shrink();
        }

        return Material(
          child: Switch(
            value: state.isVibrationOn,
            onChanged: (bool value) {
              context.read<SettingsBloc>().add(VibrationToggled(isOn: value));
            },
          ),
        );
      },
    );
  }
}
