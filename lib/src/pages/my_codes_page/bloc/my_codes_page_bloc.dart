import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:cartips_test_project/src/domain/api/qrcodes_api/qrcodes_api.dart';
import 'package:cartips_test_project/src/domain/entities/qrcode.dart';
import 'package:cartips_test_project/src/domain/entities/qrcode_category.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

part 'my_codes_page_event.dart';
part 'my_codes_page_state.dart';

class MyCodesPageBloc extends Bloc<MyCodesPageEvent, MyCodesPageState> {
  MyCodesPageBloc()
      : super(MyCodesPageState(
          selectedCategoryIndex: 0,
          categories: [],
          qrcodesOfCategory: [],
          stateStatus: MyCodesPageStateStatus.complete,
        )) {
    on<MyCodesPageEvent>(
      (event, emit) async {
        if (event is MyCodesPageChangeCategoryEvent) {
          await _changeCategory(emit: emit, event: event);
        } else if (event is MyCodesPageUpdateQrcodesListEvent) {
          await _updateQrcodesList(emit: emit);
        } else if (event is MyCodesPageUpdateCategoriesAndQrcodesListsEvent) {
          await _updateCategoriesAndQrcodesLists(emit: emit);
        }
      },
      transformer: restartable(),
    );
    add(MyCodesPageUpdateCategoriesAndQrcodesListsEvent());
  }

  Future<void> _updateCategoriesAndQrcodesLists({
    required Emitter<MyCodesPageState> emit,
  }) async {
    emit(state.copyWith(stateStatus: MyCodesPageStateStatus.loading));
    try {
      final List<QrcodeCategory> categories =
          await QrcodesApi.instance.getCategories() ?? [];
      final List<Qrcode> qrcodesOfCategory;
      if (categories.isNotEmpty) {
        qrcodesOfCategory = await QrcodesApi.instance.getQrcodesOfCategory(
                id: categories[state.selectedCategoryIndex].id) ??
            [];
      } else {
        qrcodesOfCategory = [];
        emit(state.copyWith(
          categories: categories,
          qrcodesOfCategory: qrcodesOfCategory,
          stateStatus: MyCodesPageStateStatus.failure,
        ));
        return;
      }

      emit(state.copyWith(
        categories: categories,
        qrcodesOfCategory: qrcodesOfCategory,
        stateStatus: MyCodesPageStateStatus.complete,
      ));
    } on DioError catch (_) {
      emit(state.copyWith(stateStatus: MyCodesPageStateStatus.failure));
    }
  }

  Future<void> _changeCategory({
    required MyCodesPageChangeCategoryEvent event,
    required Emitter<MyCodesPageState> emit,
  }) async {
    emit(state.copyWith(
        stateStatus: MyCodesPageStateStatus.loading,
        selectedCategoryIndex: event.index));
    await _updateQrcodesList(emit: emit);
  }

  Future<void> _updateQrcodesList({
    required Emitter<MyCodesPageState> emit,
  }) async {
    if (state.stateStatus != MyCodesPageStateStatus.loading) {
      emit(state.copyWith(stateStatus: MyCodesPageStateStatus.loading));
    }
    try {
      final List<Qrcode> qrcodesOfCategory = await QrcodesApi.instance
              .getQrcodesOfCategory(
                  id: state.categories[state.selectedCategoryIndex].id) ??
          [];
      emit(state.copyWith(
        qrcodesOfCategory: qrcodesOfCategory,
        stateStatus: MyCodesPageStateStatus.complete,
      ));
    } on DioError catch (_) {
      emit(state.copyWith(stateStatus: MyCodesPageStateStatus.failure));
    }
  }
}
