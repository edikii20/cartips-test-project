import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:cartips_test_project/src/config/colors.dart';
import 'package:cartips_test_project/src/config/sizes.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class MyCodesPageWidget extends StatelessWidget {
  const MyCodesPageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sizeRatio = AppSizes.getSizeRatio(context);

    return Scaffold(
      bottomNavigationBar: _AppBottomNavBar(
        sizeRatio: sizeRatio,
        initialIndex: 2,
      ),
      body: SafeArea(
        child: Column(
          children: [
            _MyCodesPageHeaderWidget(
              sizeRatio: sizeRatio,
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

class _AppBottomNavBar extends StatefulWidget {
  const _AppBottomNavBar({
    Key? key,
    required this.sizeRatio,
    required this.initialIndex,
  }) : super(key: key);

  final Size sizeRatio;

  final int initialIndex;

  @override
  State<_AppBottomNavBar> createState() => _AppBottomNavBarState();
}

class _AppBottomNavBarState extends State<_AppBottomNavBar> {
  late int selectedIndex;
  @override
  void initState() {
    super.initState();
    selectedIndex = widget.initialIndex;
  }

  void onChange({required int index}) {
    selectedIndex = index;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.black,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20 * widget.sizeRatio.width),
          topRight: Radius.circular(20 * widget.sizeRatio.width),
        ),
      ),
      padding: EdgeInsets.only(
        top: 16 * widget.sizeRatio.height,
        bottom: 36 * widget.sizeRatio.height,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _AppBottomNavBarItem(
            sizeRatio: widget.sizeRatio,
            selectedIndex: selectedIndex,
            itemIndex: 0,
            onChange: onChange,
            iconPath: 'assets/images/settings_icon.png',
            title: 'Настройки',
            selectedIconColor: AppColors.black,
            unSelectedIconColor: AppColors.white,
            selectedTabColor: AppColors.grey,
            unSelectedTabColor: Colors.transparent,
          ),
          _AppBottomNavBarItem(
            sizeRatio: widget.sizeRatio,
            selectedIndex: selectedIndex,
            itemIndex: 1,
            onChange: onChange,
            iconPath: 'assets/images/qrcode_icon.png',
            title: 'Мои коды',
            selectedIconColor: AppColors.black,
            unSelectedIconColor: AppColors.white,
            selectedTabColor: AppColors.grey,
            unSelectedTabColor: Colors.transparent,
          ),
          _AppBottomNavBarItem(
            sizeRatio: widget.sizeRatio,
            selectedIndex: selectedIndex,
            itemIndex: 2,
            onChange: onChange,
            iconPath: 'assets/images/profile_icon.png',
            title: 'Профиль',
            selectedIconColor: AppColors.black,
            unSelectedIconColor: AppColors.white,
            selectedTabColor: AppColors.grey,
            unSelectedTabColor: Colors.transparent,
          ),
        ],
      ),
    );
  }
}

class _AppBottomNavBarItem extends StatefulWidget {
  const _AppBottomNavBarItem({
    Key? key,
    required this.sizeRatio,
    required this.selectedIndex,
    required this.itemIndex,
    required this.onChange,
    required this.iconPath,
    required this.selectedIconColor,
    required this.selectedTabColor,
    required this.title,
    required this.unSelectedIconColor,
    required this.unSelectedTabColor,
  }) : super(key: key);

  final Size sizeRatio;
  final int selectedIndex;
  final int itemIndex;
  final String iconPath;
  final String title;
  final Color unSelectedIconColor;
  final Color selectedIconColor;
  final Color unSelectedTabColor;
  final Color selectedTabColor;
  final void Function({required int index}) onChange;

  @override
  State<_AppBottomNavBarItem> createState() => _AppBottomNavBarItemState();
}

class _AppBottomNavBarItemState extends State<_AppBottomNavBarItem>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: const Duration(milliseconds: 250),
      vsync: this,
    );
    final curve = CurvedAnimation(parent: controller, curve: Curves.easeInOut);
    animation = Tween<double>(
            begin: 20 * widget.sizeRatio.width,
            end: 126 * widget.sizeRatio.width)
        .animate(curve)
      ..addListener(() {
        setState(() {});
      });
    if (widget.selectedIndex == widget.itemIndex) {
      controller.forward();
    }
  }

  @override
  void didUpdateWidget(covariant _AppBottomNavBarItem oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.selectedIndex == widget.itemIndex) {
      controller.forward();
    } else if (oldWidget.selectedIndex == widget.itemIndex) {
      controller.reverse();
    }
  }

  @override
  void dispose() {
    animation.removeListener(() {
      setState(() {});
    });

    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => widget.onChange(index: widget.itemIndex),
      child: Container(
        height: 48 * widget.sizeRatio.height,
        width: animation.value,
        decoration: BoxDecoration(
          color: animation.value > 25 * widget.sizeRatio.width
              ? widget.selectedTabColor
              : widget.unSelectedTabColor,
          borderRadius: BorderRadius.circular(100 * widget.sizeRatio.width),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 20 * widget.sizeRatio.width,
              height: 20 * widget.sizeRatio.width,
              child: Image.asset(
                widget.iconPath,
                fit: BoxFit.contain,
                color: animation.value > 20 * widget.sizeRatio.width
                    ? widget.selectedIconColor
                    : widget.unSelectedIconColor,
              ),
            ),
            SizedBox(
                width: animation.value > 40 * widget.sizeRatio.width
                    ? 11 * widget.sizeRatio.width
                    : 0),
            Text(
              animation.value >= 100 * widget.sizeRatio.width
                  ? widget.title
                  : '',
              style: TextStyle(
                color: AppColors.black,
                fontFamily: 'Roboto',
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

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
        padding: EdgeInsets.symmetric(horizontal: 21 * sizeRatio.width),
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
                  borderRadius: BorderRadius.circular(20 * sizeRatio.height),
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
    );
  }
}

class _MyCodesPageCategoriesWidget extends StatelessWidget {
  const _MyCodesPageCategoriesWidget({
    Key? key,
    required this.sizeRatio,
  }) : super(key: key);
  final Size sizeRatio;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 22 * sizeRatio.height,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 21 * sizeRatio.width),
        itemCount: 5,
        separatorBuilder: (context, index) =>
            SizedBox(width: 8 * sizeRatio.width),
        itemBuilder: (context, index) {
          return Container(
            padding: EdgeInsets.symmetric(
              horizontal: 10 * sizeRatio.width,
              vertical: 3 * sizeRatio.height,
            ),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: AppColors.black,
              borderRadius: BorderRadius.circular(41 * sizeRatio.height),
              // border: Border.all(
              //   color: AppColors.secondary,
              //   width: 2,
              // ),
            ),
            child: Text(
              'Все коды',
              style: TextStyle(
                color: AppColors.white,
                fontFamily: 'Roboto',
                fontSize: 14,
              ),
            ),
          );
        },
      ),
    );
  }
}

class _MyCodesPageHeaderWidget extends StatelessWidget {
  const _MyCodesPageHeaderWidget({
    Key? key,
    required this.sizeRatio,
  }) : super(key: key);

  final Size sizeRatio;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 20 * sizeRatio.width,
        right: 24 * sizeRatio.width,
        top: 15 * sizeRatio.height,
        bottom: 14 * sizeRatio.height,
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              'Мои коды',
              style: TextStyle(
                color: AppColors.black,
                fontFamily: 'Roboto',
                fontSize: 24,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          IconButton(
            onPressed: () {},
            constraints: BoxConstraints.tight(
                Size(25 * sizeRatio.width, 27 * sizeRatio.width)),
            padding: EdgeInsets.zero,
            splashRadius: 25 * sizeRatio.width,
            icon: Image.asset('assets/images/notifications_icon.png'),
          ),
        ],
      ),
    );
  }
}
