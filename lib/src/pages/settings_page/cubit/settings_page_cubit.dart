import 'package:cartips_test_project/src/domain/repositories/settings_repository.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'settings_page_state.dart';

class SettingsPageCubit extends Cubit<SettingsPageState> {
  final SettingsRepository _settingsRepository;
  SettingsPageCubit({
    required SettingsRepository settingsRepository,
    required String language,
  })  : _settingsRepository = settingsRepository,
        super(SettingsPageState(
          selectedLanguage: language,
          languages: settingsRepository.languages,
        ));

  Future<void> onChangeLanguage({required String language}) async {
    await _settingsRepository.saveAppLanguage(language: language);
    final newLanguages = _sortMapLanguages(language: language);
    emit(state.copyWith(
      selectedLanguage: language,
      languages: newLanguages,
    ));
  }

  Map<String, String> _sortMapLanguages({required String language}) {
    final languagesEntries = _settingsRepository.languages.entries.toList();
    final selectedLanguageIndex =
        languagesEntries.indexWhere((element) => element.key == language);
    languagesEntries.insert(
        0, languagesEntries.removeAt(selectedLanguageIndex));

    return Map.fromEntries(languagesEntries);
  }
}
