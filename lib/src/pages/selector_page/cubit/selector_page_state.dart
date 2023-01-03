part of 'selector_page_cubit.dart';

class SelectorPageState {
  final int selectedIndex;
  SelectorPageState({
    required this.selectedIndex,
  });

  SelectorPageState copyWith({
    int? selectedIndex,
  }) {
    return SelectorPageState(
      selectedIndex: selectedIndex ?? this.selectedIndex,
    );
  }

  @override
  bool operator ==(covariant SelectorPageState other) {
    if (identical(this, other)) return true;

    return other.selectedIndex == selectedIndex;
  }

  @override
  int get hashCode => selectedIndex.hashCode;
}
