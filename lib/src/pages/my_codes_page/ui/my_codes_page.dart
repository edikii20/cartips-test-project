import 'package:cartips_test_project/src/config/styles/colors.dart';
import 'package:cartips_test_project/src/config/styles/sizes.dart';
import 'package:cartips_test_project/src/config/styles/text_styles.dart';
import 'package:cartips_test_project/src/pages/my_codes_page/bloc/my_codes_page_bloc.dart';
import 'package:cartips_test_project/src/utils/custom_app_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

part 'components/my_codes_page_categories_widget.dart';
part 'components/my_codes_page_qrcodes_list_widget.dart';
part 'components/my_codes_page_update_button_widget.dart';
part 'components/my_codes_page_qrcode_widget.dart';
part 'components/my_codes_page_category_widget.dart';

class MyCodesPageWidget extends StatelessWidget {
  const MyCodesPageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sizeRatio = AppSizes.getSizeRatio(context);
    return Column(
      children: [
        CustomAppBar(
          sizeRatio: sizeRatio,
          title: AppLocalizations.of(context)!.myCodesPageTitle,
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
    );
  }
}
