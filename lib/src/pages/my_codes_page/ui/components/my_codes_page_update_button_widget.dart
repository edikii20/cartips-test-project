part of '../my_codes_page.dart';

class _MyCodesPageUpdateButtonWidget extends StatelessWidget {
  const _MyCodesPageUpdateButtonWidget({
    Key? key,
    required void Function()? onPressed,
  })  : _onPressed = onPressed,
        super(key: key);

  final void Function()? _onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: _onPressed,
      style: ButtonStyle(
        elevation: MaterialStateProperty.all<double>(0),
        backgroundColor: MaterialStateProperty.all<Color>(AppColors.black),
      ),
      child: Text(
        AppLocalizations.of(context)!.update,
        style: AppTextStyles.medium(
          fontSize: 18,
          color: AppColors.white,
        ),
      ),
    );
  }
}
