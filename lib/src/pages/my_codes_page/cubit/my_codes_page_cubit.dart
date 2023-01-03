import 'package:bloc/bloc.dart';
import 'package:cartips_test_project/src/domain/api/qrcodes_api/qrcodes_api.dart';
import 'package:cartips_test_project/src/domain/entities/qrcode.dart';
import 'package:cartips_test_project/src/domain/entities/qrcode_category.dart';

import 'package:flutter/foundation.dart';

part 'my_codes_page_state.dart';

class MyCodesPageCubit extends Cubit<MyCodesPageState> {
  MyCodesPageCubit()
      : super(MyCodesPageState(
          selectedCategoryIndex: 0,
          categories: [],
          qrcodesOfCategory: [],
          stateStatus: MyCodesPageStateStatus.complete,
        )) {
    setup();
  }

  Future<void> setup() async {
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
      }

      emit(state.copyWith(
        categories: categories,
        qrcodesOfCategory: qrcodesOfCategory,
        stateStatus: MyCodesPageStateStatus.complete,
      ));
    } catch (_) {
      emit(state.copyWith(stateStatus: MyCodesPageStateStatus.failure));
    }
  }

  Future<void> onChangeCategory({required int index}) async {
    if (index == state.selectedCategoryIndex) return;
    emit(state.copyWith(
        stateStatus: MyCodesPageStateStatus.loading,
        selectedCategoryIndex: index));
    updateQrcodesList();
  }

  Future<void> updateQrcodesList() async {
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
    } catch (_) {
      emit(state.copyWith(stateStatus: MyCodesPageStateStatus.failure));
    }
  }
}
