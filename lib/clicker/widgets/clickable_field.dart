import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solid_test/clicker/clicker.dart';

class ClickableField extends StatelessWidget {
  const ClickableField({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ClickerBloc, ClickerState>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () => _onTap(context),
          onLongPress: () => _onLongPress(context),
          child: AnimatedContainer(
            decoration: BoxDecoration(color: state.currentColor),
            duration: const Duration(milliseconds: 100),
            child: Stack(
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 128),
                    child: ClicksCounter(
                      count: state.clicksCount,
                      color: state.extraColor,
                    ),
                  ),
                ),
                Center(
                  child: ClickerScreenTitle(color: state.extraColor),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _onTap(BuildContext context) {
    context.read<ClickerBloc>().add(const UserClicked());
  }

  void _onLongPress(BuildContext context) {
    context.read<ClickerBloc>().add(const UserLongClicked());
  }
}
