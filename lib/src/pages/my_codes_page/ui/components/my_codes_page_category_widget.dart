part of '../my_codes_page.dart';

class _MyCodesPageCategoryWidget extends StatelessWidget {
  const _MyCodesPageCategoryWidget({
    Key? key,
    required Size sizeRatio,
    required int index,
    required int selectedCategoryIndex,
    required String title,
  })  : _sizeRatio = sizeRatio,
        _index = index,
        _selectedCategoryIndex = selectedCategoryIndex,
        _title = title,
        super(key: key);

  final Size _sizeRatio;
  final int _index;
  final int _selectedCategoryIndex;
  final String _title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _selectedCategoryIndex == _index
          ? null
          : context
              .read<MyCodesPageBloc>()
              .add(MyCodesPageChangeCategoryEvent(index: _index)),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: _selectedCategoryIndex == _index
              ? 10 * _sizeRatio.width
              : 10 * _sizeRatio.width - 2,
          vertical: _selectedCategoryIndex == _index
              ? 3 * _sizeRatio.height
              : 3 * _sizeRatio.height - 2,
        ),
        decoration: BoxDecoration(
          color: _selectedCategoryIndex == _index
              ? AppColors.black
              : AppColors.white,
          borderRadius: BorderRadius.circular(41 * _sizeRatio.height),
          border: _selectedCategoryIndex == _index
              ? null
              : Border.all(
                  color: AppColors.disable,
                  width: 2,
                ),
        ),
        child: Text(
          _title,
          style: AppTextStyles.regular(
            fontSize: 14,
            color: _selectedCategoryIndex == _index
                ? AppColors.white
                : Colors.black,
          ),
        ),
      ),
    );
  }
}
