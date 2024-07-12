import 'package:shared_preferences/shared_preferences.dart';
import 'package:solid_test/data/data.dart';
import 'package:solid_test/domain/domain.dart';

class SettingsRepoImpl extends SettingsRepo {
  const SettingsRepoImpl();

  @override
  Future<bool> isVibrationOn() async {
    final prefs = await SharedPreferences.getInstance();
    final isOn = prefs.getBool(PrefsKeys.isVibrationOn) ?? true;

    return isOn;
  }

  @override
  Future<void> toggleVibration({required bool isOn}) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(PrefsKeys.isVibrationOn, isOn);
  }
}
