part of 'settings_bloc.dart';

sealed class SettingsState extends Equatable {
  const SettingsState();
}

final class SettingsInitialState extends SettingsState {
  @override
  List<Object?> get props => [];

  const SettingsInitialState();
}

final class SettingsLoadedState extends SettingsState {
  final bool isVibrationOn;

  @override
  List<Object> get props => [isVibrationOn];

  const SettingsLoadedState({required this.isVibrationOn});

  SettingsLoadedState copyWith({
    bool? isVibrationOn,
  }) {
    return SettingsLoadedState(
      isVibrationOn: isVibrationOn ?? this.isVibrationOn,
    );
  }
}
