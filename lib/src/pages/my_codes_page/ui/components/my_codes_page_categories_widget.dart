part of '../my_codes_page.dart';

class _MyCodesPageCategoriesWidget extends StatelessWidget {
  const _MyCodesPageCategoriesWidget({
    Key? key,
    required Size sizeRatio,
  })  : _sizeRatio = sizeRatio,
        super(key: key);

  final Size _sizeRatio;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 22 * _sizeRatio.height,
      child: BlocBuilder<MyCodesPageCubit, MyCodesPageState>(
        buildWhen: (previous, current) =>
            previous.selectedCategoryIndex != current.selectedCategoryIndex ||
            previous.categories != current.categories,
        builder: (context, state) {
          return ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: 21 * _sizeRatio.width),
            itemCount: state.categories.length,
            separatorBuilder: (context, index) =>
                SizedBox(width: 8 * _sizeRatio.width),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () => context
                    .read<MyCodesPageCubit>()
                    .onChangeCategory(index: index),
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: state.selectedCategoryIndex == index
                        ? 10 * _sizeRatio.width
                        : 10 * _sizeRatio.width - 2,
                    vertical: state.selectedCategoryIndex == index
                        ? 3 * _sizeRatio.height
                        : 3 * _sizeRatio.height - 2,
                  ),
                  decoration: BoxDecoration(
                    color: state.selectedCategoryIndex == index
                        ? AppColors.black
                        : AppColors.white,
                    borderRadius: BorderRadius.circular(41 * _sizeRatio.height),
                    border: state.selectedCategoryIndex == index
                        ? null
                        : Border.all(
                            color: AppColors.disable,
                            width: 2,
                          ),
                  ),
                  child: Text(
                    state.categories[index].title,
                    style: TextStyle(
                      color: state.selectedCategoryIndex == index
                          ? AppColors.white
                          : Colors.black,
                      fontFamily: 'Roboto',
                      fontSize: 14,
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
