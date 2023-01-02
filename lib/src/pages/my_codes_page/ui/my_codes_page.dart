import 'package:cartips_test_project/src/config/styles/colors.dart';
import 'package:cartips_test_project/src/config/styles/sizes.dart';
import 'package:cartips_test_project/src/pages/my_codes_page/cubit/my_codes_page_cubit.dart';
import 'package:cartips_test_project/src/utils/custom_app_bar_widget.dart';
import 'package:cartips_test_project/src/utils/custom_app_bottom_navigation_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'components/my_codes_page_categories_widget.dart';
part 'components/my_codes_page_qrcodes_list_widget.dart';

class MyCodesPageWidget extends StatelessWidget {
  const MyCodesPageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sizeRatio = AppSizes.getSizeRatio(context);
    return Scaffold(
      backgroundColor: AppColors.white,
      bottomNavigationBar: BlocBuilder<MyCodesPageCubit, MyCodesPageState>(
        buildWhen: (previous, current) =>
            previous.selectedBottomNavigationItemIndex !=
            current.selectedBottomNavigationItemIndex,
        builder: (context, state) {
          return CustomAppBottomNavigationBar(
            sizeRatio: sizeRatio,
            selectedIndex: state.selectedBottomNavigationItemIndex,
            onChange: context
                .read<MyCodesPageCubit>()
                .onChangeBottomNavigationItemIndex,
          );
        },
      ),
      body: SafeArea(
        child: Column(
          children: [
            CustomAppBar(
              sizeRatio: sizeRatio,
              title: 'Мои коды',
              actions: [
                IconButton(
                  onPressed: () {},
                  constraints: BoxConstraints.tight(
                    Size(25 * sizeRatio.width, 27 * sizeRatio.width),
                  ),
                  padding: EdgeInsets.zero,
                  splashRadius: 25 * sizeRatio.width,
                  icon: Image.asset('assets/images/notifications_icon.png'),
                ),
              ],
            ),
            SizedBox(height: 35 * sizeRatio.height),
            _MyCodesPageCategoriesWidget(
              sizeRatio: sizeRatio,
            ),
            SizedBox(height: 40 * sizeRatio.height),
            _MyCodesPageQrCodesListWidget(
              sizeRatio: sizeRatio,
            ),
          ],
        ),
      ),
    );
  }
}
