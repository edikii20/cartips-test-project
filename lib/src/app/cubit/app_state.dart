part of 'app_cubit.dart';

class AppState {
  final String currentLanguage;
  AppState({
    required this.currentLanguage,
  });

  AppState copyWith({
    String? currentLanguage,
  }) {
    return AppState(
      currentLanguage: currentLanguage ?? this.currentLanguage,
    );
  }

  @override
  bool operator ==(covariant AppState other) {
    if (identical(this, other)) return true;

    return other.currentLanguage == currentLanguage;
  }

  @override
  int get hashCode => currentLanguage.hashCode;
}
