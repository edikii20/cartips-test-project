import 'package:cartips_test_project/src/app/cubit/app_cubit.dart';
import 'package:cartips_test_project/src/domain/repositories/settings_repository.dart';
import 'package:cartips_test_project/src/pages/my_codes_page/bloc/my_codes_page_bloc.dart';
import 'package:cartips_test_project/src/pages/selector_page/cubit/selector_page_cubit.dart';
import 'package:cartips_test_project/src/pages/settings_page/cubit/settings_page_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:hive_flutter/hive_flutter.dart';

import 'src/app/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  final settingsRepository = SettingsRepository();
  final language = await settingsRepository.getAppLanguage();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => AppCubit(language: language),
        ),
        BlocProvider(
          create: (_) => MyCodesPageBloc(),
        ),
        BlocProvider(
          create: (_) => SettingsPageCubit(
            settingsRepository: settingsRepository,
            language: language,
          ),
        ),
        BlocProvider(
          create: (_) => SelectorPageCubit(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}
