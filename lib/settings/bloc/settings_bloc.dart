import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:solid_test/domain/domain.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  final SettingsRepo _settingsRepo;

  SettingsBloc({required SettingsRepo settingsRepo})
      : _settingsRepo = settingsRepo,
        super(const SettingsInitialState()) {
    on<SettingsInited>(_onSettingsInited);
    on<VibrationToggled>(_onVibrationToggled);
  }

  Future<void> _onSettingsInited(
    SettingsInited event,
    Emitter<SettingsState> emit,
  ) async {
    final isVibrationOn = await _settingsRepo.isVibrationOn();

    emit(SettingsLoadedState(isVibrationOn: isVibrationOn));
  }

  Future<void> _onVibrationToggled(
    VibrationToggled event,
    Emitter<SettingsState> emit,
  ) async {
    await _settingsRepo.toggleVibration(isOn: event.isOn);

    final currentState = state as SettingsLoadedState;
    emit(currentState.copyWith(isVibrationOn: event.isOn));
  }
}
