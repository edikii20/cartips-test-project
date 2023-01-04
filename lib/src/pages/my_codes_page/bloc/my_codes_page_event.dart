part of 'my_codes_page_bloc.dart';

@immutable
abstract class MyCodesPageEvent {}

class MyCodesPageChangeCategoryEvent extends MyCodesPageEvent {
  final int index;

  MyCodesPageChangeCategoryEvent({required this.index});
}

class MyCodesPageUpdateQrcodesListEvent extends MyCodesPageEvent {}

class MyCodesPageUpdateCategoriesAndQrcodesListsEvent extends MyCodesPageEvent {
}
