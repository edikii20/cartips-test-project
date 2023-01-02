part of '../my_codes_page.dart';

class _MyCodesPageQrCodesListWidget extends StatelessWidget {
  const _MyCodesPageQrCodesListWidget({
    Key? key,
    required this.sizeRatio,
  }) : super(key: key);

  final Size sizeRatio;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(
          left: 21 * sizeRatio.width,
          right: 9 * sizeRatio.width,
        ),
        child: Scrollbar(
          radius: const Radius.circular(8),
          child: Padding(
            padding: EdgeInsets.only(right: 12 * sizeRatio.width),
            child: BlocBuilder<MyCodesPageCubit, MyCodesPageState>(
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
                    child: ElevatedButton(
                      onPressed: () {
                        if (state.categories.isEmpty) {
                          context.read<MyCodesPageCubit>().setup();
                        } else {
                          context.read<MyCodesPageCubit>().updateQrcodesList();
                        }
                      },
                      style: ButtonStyle(
                        elevation: MaterialStateProperty.all<double>(0),
                        backgroundColor:
                            MaterialStateProperty.all<Color>(AppColors.black),
                      ),
                      child: Text(
                        'Обновить',
                        style: TextStyle(
                          color: AppColors.white,
                          fontFamily: 'Roboto',
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  );
                } else {
                  return ListView.separated(
                    padding: EdgeInsets.only(bottom: 40 * sizeRatio.height),
                    itemCount: state.qrcodesOfCategory.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {},
                        borderRadius:
                            BorderRadius.circular(20 * sizeRatio.height),
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 18 * sizeRatio.width,
                            vertical: 14 * sizeRatio.height,
                          ),
                          decoration: BoxDecoration(
                            color: Color(int.parse(
                              state.qrcodesOfCategory[index].color,
                              radix: 16,
                            )).withOpacity(0.2),
                            borderRadius:
                                BorderRadius.circular(20 * sizeRatio.height),
                          ),
                          child: Row(
                            children: [
                              Container(
                                width: 36 * sizeRatio.height,
                                height: 37 * sizeRatio.height,
                                decoration: BoxDecoration(
                                  color: Color(int.parse(
                                    state.qrcodesOfCategory[index].color,
                                    radix: 16,
                                  )).withOpacity(1),
                                  borderRadius: BorderRadius.circular(
                                      10 * sizeRatio.height),
                                ),
                                child: Image.asset(
                                    'assets/images/qrcode_icon.png'),
                              ),
                              SizedBox(width: 23 * sizeRatio.width),
                              Text(
                                state.qrcodesOfCategory[index].title,
                                style: TextStyle(
                                  color: AppColors.black,
                                  fontFamily: 'Roboto',
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) =>
                        SizedBox(height: 14 * sizeRatio.height),
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
