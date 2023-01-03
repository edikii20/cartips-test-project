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
              return _MyCodesPageCategoryWidget(
                sizeRatio: _sizeRatio,
                index: index,
                selectedCategoryIndex: state.selectedCategoryIndex,
                title: state.categories[index].title,
              );
            },
          );
        },
      ),
    );
  }
}
