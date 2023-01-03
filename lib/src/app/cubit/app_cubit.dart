import 'package:bloc/bloc.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit({required String language})
      : super(AppState(currentLanguage: language));

  void changeAppLanguage({required String language}) {
    emit(state.copyWith(currentLanguage: language));
  }
}
