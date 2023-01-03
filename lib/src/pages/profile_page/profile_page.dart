import 'package:cartips_test_project/src/config/styles/colors.dart';
import 'package:cartips_test_project/src/utils/custom_app_bar_widget.dart';
import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../config/styles/sizes.dart';

class ProfilePageWidget extends StatelessWidget {
  const ProfilePageWidget({Key? key}) : super(key: key);

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
              title: AppLocalizations.of(context)!.profilePageTitle,
            ),
          ],
        ),
      ),
    );
  }
}
