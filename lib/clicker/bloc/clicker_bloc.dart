import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:solid_test/domain/domain.dart';
import 'package:solid_test/utils/utils.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vibration/vibration.dart';

part 'clicker_event.dart';
part 'clicker_state.dart';

class ClickerBloc extends Bloc<ClickerEvent, ClickerState> {
  final SettingsRepo _settingsRepo;

  ClickerBloc({required SettingsRepo settingsRepo})
      : _settingsRepo = settingsRepo,
        super(const ClickerState()) {
    on<UserClicked>(_onUserClicked);
    on<UserLongClicked>(_onUserLongClicked);
  }

  Future<void> _onUserClicked(
    UserClicked event,
    Emitter<ClickerState> emit,
  ) async {
    final newColor = ColorUtils.generateRandomColor();

    emit(
      state.copyWith(
        currentColor: newColor,
        clicksCount: state.clicksCount + 1,
      ),
    );

    final isVibrationOn = await _settingsRepo.isVibrationOn();
    if (isVibrationOn) {
      await _vibrate();
    }
  }

  void _onUserLongClicked(UserLongClicked event, Emitter<ClickerState> emit) {
    _rickRoll();
  }

  Future<void> _rickRoll() async {
    final url = Uri.parse('https://www.youtube.com/watch?v=dQw4w9WgXcQ');

    if (!await launchUrl(url)) {
      throw Exception('Could not launch url');
    }
  }

  Future<void> _vibrate() async {
    final hasVibrator = await Vibration.hasVibrator() ?? false;

    if (hasVibrator) {
      await Vibration.vibrate(duration: 1);
    }
  }
}
