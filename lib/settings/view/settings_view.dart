import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solid_test/app/app.dart';
import 'package:solid_test/domain/domain.dart';
import 'package:solid_test/l10n/l10n.dart';
import 'package:solid_test/settings/settings.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  static void open(BuildContext context) {
    showDialog<void>(
      context: context,
      builder: (_) {
        return BlocProvider(
          create: (_) => SettingsBloc(
            settingsRepo: context.read<SettingsRepo>(),
          )..add(const SettingsInited()),
          child: const SettingsView(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.all(24),
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24),
          ),
          child: Row(
            children: [
              Text(context.l10n.vibration, style: h3),
              const Spacer(),
              const VibrationSwitch(),
            ],
          ),
        ),
      ],
    );
  }
}
