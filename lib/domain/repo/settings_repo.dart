abstract class SettingsRepo {
  const SettingsRepo();

  Future<bool> isVibrationOn();

  Future<void> toggleVibration({required bool isOn});
}
