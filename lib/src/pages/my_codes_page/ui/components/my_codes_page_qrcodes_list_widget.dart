part of '../my_codes_page.dart';

class _MyCodesPageQrCodesListWidget extends StatelessWidget {
  const _MyCodesPageQrCodesListWidget({
    Key? key,
    required Size sizeRatio,
  })  : _sizeRatio = sizeRatio,
        super(key: key);

  final Size _sizeRatio;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(
          left: 21 * _sizeRatio.width,
          right: 9 * _sizeRatio.width,
        ),
        child: Scrollbar(
          radius: const Radius.circular(8),
          child: Padding(
            padding: EdgeInsets.only(right: 12 * _sizeRatio.width),
            child: BlocBuilder<MyCodesPageBloc, MyCodesPageState>(
              buildWhen: (previous, current) =>
                  previous.stateStatus != current.stateStatus,
              builder: (context, state) {
                if (state.stateStatus == MyCodesPageStateStatus.loading) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: AppColors.black,
                    ),
                  );
                } else if (state.stateStatus ==
                    MyCodesPageStateStatus.failure) {
                  return Center(
                    child: _MyCodesPageUpdateButtonWidget(
                      onPressed: () {
                        if (state.categories.isEmpty) {
                          context.read<MyCodesPageBloc>().add(
                              MyCodesPageUpdateCategoriesAndQrcodesListsEvent());
                        } else {
                          context
                              .read<MyCodesPageBloc>()
                              .add(MyCodesPageUpdateQrcodesListEvent());
                        }
                      },
                    ),
                  );
                } else {
                  return ListView.separated(
                    padding: EdgeInsets.only(bottom: 40 * _sizeRatio.height),
                    itemCount: state.qrcodesOfCategory.length,
                    itemBuilder: (context, index) {
                      return _MyCodesPageQrcodeWidget(
                        sizeRatio: _sizeRatio,
                        color: state.qrcodesOfCategory[index].color,
                        title: state.qrcodesOfCategory[index].title,
                      );
                    },
                    separatorBuilder: (context, index) =>
                        SizedBox(height: 14 * _sizeRatio.height),
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
