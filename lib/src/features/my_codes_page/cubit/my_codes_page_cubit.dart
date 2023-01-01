import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'my_codes_page_state.dart';

class MyCodesPageCubit extends Cubit<MyCodesPageState> {
  MyCodesPageCubit() : super(MyCodesPageInitial());
}
