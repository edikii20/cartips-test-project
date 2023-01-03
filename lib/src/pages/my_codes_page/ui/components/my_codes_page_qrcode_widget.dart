part of '../my_codes_page.dart';

class _MyCodesPageQrcodeWidget extends StatelessWidget {
  const _MyCodesPageQrcodeWidget({
    Key? key,
    required Size sizeRatio,
    required String title,
    required String color,
  })  : _sizeRatio = sizeRatio,
        _title = title,
        _color = color,
        super(key: key);

  final Size _sizeRatio;
  final String _color;
  final String _title;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      borderRadius: BorderRadius.circular(20 * _sizeRatio.height),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 18 * _sizeRatio.width,
          vertical: 14 * _sizeRatio.height,
        ),
        decoration: BoxDecoration(
          color: Color(int.parse(
            _color,
            radix: 16,
          )).withOpacity(0.2),
          borderRadius: BorderRadius.circular(20 * _sizeRatio.height),
        ),
        child: Row(
          children: [
            Container(
              width: 36 * _sizeRatio.height,
              height: 37 * _sizeRatio.height,
              decoration: BoxDecoration(
                color: Color(int.parse(
                  _color,
                  radix: 16,
                )).withOpacity(1),
                borderRadius: BorderRadius.circular(10 * _sizeRatio.height),
              ),
              child: Image.asset('assets/images/qrcode_icon.png'),
            ),
            SizedBox(width: 23 * _sizeRatio.width),
            Text(
              _title,
              style: AppTextStyles.medium(
                fontSize: 18,
                color: AppColors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
