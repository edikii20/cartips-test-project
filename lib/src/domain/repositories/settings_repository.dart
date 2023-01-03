import 'package:cartips_test_project/src/domain/db/hive_db/data_provider/box_manager.dart';

class SettingsRepository {
  final Map<String, String> _languages = {
    'ru': 'Русский',
    'en': 'English',
  };

  Map<String, String> get languages => _languages;

  Future<String> getAppLanguage() async {
    final settingsBox = await BoxManager.instance.openSettingsBox();
    if (!settingsBox.containsKey('language')) {
      await settingsBox.put('language', languages.keys.first);
    }
    final appLanguage = settingsBox.get('language');
    await BoxManager.instance.closeBox(settingsBox);
    return appLanguage ?? languages.keys.first;
  }

  Future<void> saveAppLanguage({required String language}) async {
    final settingsBox = await BoxManager.instance.openSettingsBox();
    if (settingsBox.get('language') != language) {
      await settingsBox.put('language', language);
    }

    await BoxManager.instance.closeBox(settingsBox);
  }
}
