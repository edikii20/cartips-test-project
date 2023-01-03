import 'package:bloc/bloc.dart';

part 'selector_page_state.dart';

class SelectorPageCubit extends Cubit<SelectorPageState> {
  SelectorPageCubit()
      : super(SelectorPageState(
          selectedIndex: 1,
        ));

  void onChangeSelectedIndex({required int index}) {
    if (state.selectedIndex == index) return;
    emit(state.copyWith(selectedIndex: index));
  }
}
