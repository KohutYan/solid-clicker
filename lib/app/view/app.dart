import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solid_test/app/theme/theme.dart';
import 'package:solid_test/clicker/clicker.dart';
import 'package:solid_test/data/data.dart';
import 'package:solid_test/domain/domain.dart';
import 'package:solid_test/l10n/l10n.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.mainTheme,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: RepositoryProvider<SettingsRepo>(
        create: (_) => const SettingsRepoImpl(),
        child: BlocProvider(
          create: (context) => ClickerBloc(
            settingsRepo: context.read<SettingsRepo>(),
          ),
          child: const ClickerView(),
        ),
      ),
    );
  }
}
