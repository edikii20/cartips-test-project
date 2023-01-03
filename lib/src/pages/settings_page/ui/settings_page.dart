import 'package:cartips_test_project/src/config/styles/colors.dart';
import 'package:cartips_test_project/src/pages/settings_page/cubit/settings_page_cubit.dart';
import 'package:cartips_test_project/src/utils/custom_app_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../app/cubit/app_cubit.dart';
import '../../../config/styles/sizes.dart';
import '../../../config/styles/text_styles.dart';

part 'components/settings_page_language_selector_widget.dart';

class SettingsPageWidget extends StatelessWidget {
  const SettingsPageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sizeRatio = AppSizes.getSizeRatio(context);
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Column(
          children: [
            CustomAppBar(
              sizeRatio: sizeRatio,
              title: AppLocalizations.of(context)!.settingsPageTitle,
            ),
            SizedBox(height: 35 * sizeRatio.height),
            _SettingsPageLanguageSelectorWidget(sizeRatio: sizeRatio),
          ],
        ),
      ),
    );
  }
}
