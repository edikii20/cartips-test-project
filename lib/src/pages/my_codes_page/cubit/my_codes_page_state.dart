part of 'my_codes_page_cubit.dart';

enum MyCodesPageStateStatus { complete, loading, failure }

class MyCodesPageState {
  final int selectedCategoryIndex;
  final List<QrcodeCategory> categories;
  final List<Qrcode> qrcodesOfCategory;
  final MyCodesPageStateStatus stateStatus;
  final int selectedBottomNavigationItemIndex;
  MyCodesPageState({
    required this.selectedCategoryIndex,
    required this.categories,
    required this.qrcodesOfCategory,
    required this.stateStatus,
    required this.selectedBottomNavigationItemIndex,
  });

  MyCodesPageState copyWith({
    int? selectedCategoryIndex,
    List<QrcodeCategory>? categories,
    List<Qrcode>? qrcodesOfCategory,
    MyCodesPageStateStatus? stateStatus,
    int? selectedBottomNavigationItemIndex,
  }) {
    return MyCodesPageState(
      selectedCategoryIndex:
          selectedCategoryIndex ?? this.selectedCategoryIndex,
      categories: categories ?? this.categories,
      qrcodesOfCategory: qrcodesOfCategory ?? this.qrcodesOfCategory,
      stateStatus: stateStatus ?? this.stateStatus,
      selectedBottomNavigationItemIndex: selectedBottomNavigationItemIndex ??
          this.selectedBottomNavigationItemIndex,
    );
  }

  @override
  bool operator ==(covariant MyCodesPageState other) {
    if (identical(this, other)) return true;

    return other.selectedCategoryIndex == selectedCategoryIndex &&
        listEquals(other.categories, categories) &&
        listEquals(other.qrcodesOfCategory, qrcodesOfCategory) &&
        other.stateStatus == stateStatus &&
        other.selectedBottomNavigationItemIndex ==
            selectedBottomNavigationItemIndex;
  }

  @override
  int get hashCode {
    return selectedCategoryIndex.hashCode ^
        categories.hashCode ^
        qrcodesOfCategory.hashCode ^
        stateStatus.hashCode ^
        selectedBottomNavigationItemIndex.hashCode;
  }
}
