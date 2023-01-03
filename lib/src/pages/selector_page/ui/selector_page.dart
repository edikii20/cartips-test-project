import 'package:cartips_test_project/src/config/styles/colors.dart';
import 'package:cartips_test_project/src/config/styles/sizes.dart';
import 'package:cartips_test_project/src/pages/selector_page/cubit/selector_page_cubit.dart';
import 'package:cartips_test_project/src/utils/custom_app_bottom_navigation_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SelectorPageWidget extends StatelessWidget {
  const SelectorPageWidget({Key? key, required Widget child})
      : _child = child,
        super(key: key);

  final Widget _child;

  @override
  Widget build(BuildContext context) {
    return BlocListener<SelectorPageCubit, SelectorPageState>(
      listenWhen: (previous, current) =>
          previous.selectedIndex != current.selectedIndex,
      listener: (context, state) {
        switch (state.selectedIndex) {
          case 0:
            context.go('/settings');
            break;
          case 1:
            context.go('/');
            break;
          case 2:
            context.go('/profile');
            break;
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.white,
        bottomNavigationBar: BlocBuilder<SelectorPageCubit, SelectorPageState>(
          buildWhen: (previous, current) =>
              previous.selectedIndex != current.selectedIndex,
          builder: (context, state) {
            return CustomAppBottomNavigationBar(
              sizeRatio: AppSizes.getSizeRatio(context),
              selectedIndex: state.selectedIndex,
              onChange: context.read<SelectorPageCubit>().onChangeSelectedIndex,
            );
          },
        ),
        body: SafeArea(child: _child),
      ),
    );
  }
}
