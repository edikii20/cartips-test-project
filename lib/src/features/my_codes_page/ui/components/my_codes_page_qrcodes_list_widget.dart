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
            child: ListView.separated(
              padding: EdgeInsets.only(bottom: 40 * sizeRatio.height),
              itemCount: 10,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {},
                  borderRadius: BorderRadius.circular(20 * sizeRatio.height),
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 18 * sizeRatio.width,
                      vertical: 14 * sizeRatio.height,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.green.withOpacity(0.2),
                      borderRadius:
                          BorderRadius.circular(20 * sizeRatio.height),
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 36 * sizeRatio.height,
                          height: 37 * sizeRatio.height,
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius:
                                BorderRadius.circular(10 * sizeRatio.height),
                          ),
                          child: Image.asset('assets/images/qrcode_icon.png'),
                        ),
                        SizedBox(width: 23 * sizeRatio.width),
                        Text(
                          'Моя машина',
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
            ),
          ),
        ),
      ),
    );
  }
}
