part of 'settings_page_cubit.dart';

class SettingsPageState {
  final String selectedLanguage;
  final Map<String, String> languages;
  SettingsPageState({
    required this.selectedLanguage,
    required this.languages,
  });

  SettingsPageState copyWith({
    String? selectedLanguage,
    Map<String, String>? languages,
  }) {
    return SettingsPageState(
      selectedLanguage: selectedLanguage ?? this.selectedLanguage,
      languages: languages ?? this.languages,
    );
  }

  @override
  bool operator ==(covariant SettingsPageState other) {
    if (identical(this, other)) return true;

    return other.selectedLanguage == selectedLanguage &&
        mapEquals(other.languages, languages);
  }

  @override
  int get hashCode => selectedLanguage.hashCode ^ languages.hashCode;
}
