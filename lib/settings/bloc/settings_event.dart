part of 'settings_bloc.dart';

sealed class SettingsEvent extends Equatable {
  const SettingsEvent();
}

class SettingsInited extends SettingsEvent {
  @override
  List<Object?> get props => [];

  const SettingsInited();
}

class VibrationToggled extends SettingsEvent {
  final bool isOn;

  @override
  List<Object?> get props => [isOn];

  const VibrationToggled({required this.isOn});
}
