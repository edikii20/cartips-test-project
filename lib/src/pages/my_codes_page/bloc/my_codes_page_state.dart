part of 'my_codes_page_bloc.dart';

enum MyCodesPageStateStatus { complete, loading, failure }

class MyCodesPageState {
  final int selectedCategoryIndex;
  final List<QrcodeCategory> categories;
  final List<Qrcode> qrcodesOfCategory;
  final MyCodesPageStateStatus stateStatus;
  MyCodesPageState({
    required this.selectedCategoryIndex,
    required this.categories,
    required this.qrcodesOfCategory,
    required this.stateStatus,
  });

  MyCodesPageState copyWith({
    int? selectedCategoryIndex,
    List<QrcodeCategory>? categories,
    List<Qrcode>? qrcodesOfCategory,
    MyCodesPageStateStatus? stateStatus,
  }) {
    return MyCodesPageState(
      selectedCategoryIndex:
          selectedCategoryIndex ?? this.selectedCategoryIndex,
      categories: categories ?? this.categories,
      qrcodesOfCategory: qrcodesOfCategory ?? this.qrcodesOfCategory,
      stateStatus: stateStatus ?? this.stateStatus,
    );
  }

  @override
  bool operator ==(covariant MyCodesPageState other) {
    if (identical(this, other)) return true;

    return other.selectedCategoryIndex == selectedCategoryIndex &&
        listEquals(other.categories, categories) &&
        listEquals(other.qrcodesOfCategory, qrcodesOfCategory) &&
        other.stateStatus == stateStatus;
  }

  @override
  int get hashCode {
    return selectedCategoryIndex.hashCode ^
        categories.hashCode ^
        qrcodesOfCategory.hashCode ^
        stateStatus.hashCode;
  }
}
