import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:share_plus/share_plus.dart';
import 'package:solid_test/clicker/bloc/clicker_bloc.dart';
import 'package:solid_test/l10n/l10n.dart';

class ShareButton extends StatelessWidget {
  const ShareButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ClickerBloc, ClickerState>(
      builder: (context, state) {
        return IconButton(
          onPressed: () => _onShareTapped(
            context,
            state.clicksCount,
            state.currentColorHex,
          ),
          icon: Icon(
            Icons.share,
            size: 36,
            color: state.extraColor,
          ),
        );
      },
    );
  }

  Future<void> _onShareTapped(
    BuildContext context,
    int clicksCount,
    String colorHex,
  ) async {
    final text = context.l10n.clickerShareText(clicksCount, colorHex);

    await Share.share(text);
  }
}
