part of '../settings_page.dart';

class _SettingsPageLanguageSelectorWidget extends StatelessWidget {
  const _SettingsPageLanguageSelectorWidget({
    Key? key,
    required Size sizeRatio,
  })  : _sizeRatio = sizeRatio,
        super(key: key);

  final Size _sizeRatio;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 21 * _sizeRatio.width,
        right: 26 * _sizeRatio.width,
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              AppLocalizations.of(context)!.language,
              style: AppTextStyles.medium(
                fontSize: 18,
                color: AppColors.black,
              ),
            ),
          ),
          BlocBuilder<SettingsPageCubit, SettingsPageState>(
            buildWhen: (previous, current) =>
                previous.selectedLanguage != current.selectedLanguage,
            builder: (context, state) {
              return DropdownButton(
                value: state.selectedLanguage,
                style: AppTextStyles.medium(
                  fontSize: 16,
                  color: AppColors.black,
                ),
                items: state.languages.keys
                    .map<DropdownMenuItem<String>>(
                        (key) => DropdownMenuItem<String>(
                              value: key,
                              child: Text(state.languages[key]!),
                            ))
                    .toList(),
                onChanged: (value) {
                  if (value != state.selectedLanguage) {
                    context
                        .read<SettingsPageCubit>()
                        .onChangeLanguage(language: value ?? 'en');
                    context
                        .read<AppCubit>()
                        .changeAppLanguage(language: value ?? 'en');
                  }
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
