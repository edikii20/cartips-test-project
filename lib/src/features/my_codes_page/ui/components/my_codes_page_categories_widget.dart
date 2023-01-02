part of '../my_codes_page.dart';

class _MyCodesPageCategoriesWidget extends StatelessWidget {
  const _MyCodesPageCategoriesWidget({
    Key? key,
    required Size sizeRatio,
    required int selectedIndex,
  })  : _sizeRatio = sizeRatio,
        _selectedIndex = selectedIndex,
        super(key: key);

  final Size _sizeRatio;
  final int _selectedIndex;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 22 * _sizeRatio.height,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 21 * _sizeRatio.width),
        itemCount: 5,
        separatorBuilder: (context, index) =>
            SizedBox(width: 8 * _sizeRatio.width),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {},
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: _selectedIndex == index
                    ? 10 * _sizeRatio.width
                    : 10 * _sizeRatio.width - 2,
                vertical: _selectedIndex == index
                    ? 3 * _sizeRatio.height
                    : 3 * _sizeRatio.height - 2,
              ),
              decoration: BoxDecoration(
                color:
                    _selectedIndex == index ? AppColors.black : AppColors.white,
                borderRadius: BorderRadius.circular(41 * _sizeRatio.height),
                border: _selectedIndex == index
                    ? null
                    : Border.all(
                        color: AppColors.disable,
                        width: 2,
                      ),
              ),
              child: Text(
                'Все коды',
                style: TextStyle(
                  color:
                      _selectedIndex == index ? AppColors.white : Colors.black,
                  fontFamily: 'Roboto',
                  fontSize: 14,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
