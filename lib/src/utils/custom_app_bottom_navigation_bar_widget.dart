import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../config/styles/colors.dart';
import '../config/styles/text_styles.dart';

class CustomAppBottomNavigationBar extends StatelessWidget {
  const CustomAppBottomNavigationBar({
    Key? key,
    required Size sizeRatio,
    required int selectedIndex,
    required void Function({required int index}) onChange,
  })  : _sizeRatio = sizeRatio,
        _selectedIndex = selectedIndex,
        _onChange = onChange,
        super(key: key);

  final Size _sizeRatio;
  final void Function({required int index}) _onChange;
  final int _selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.black,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20 * _sizeRatio.width),
          topRight: Radius.circular(20 * _sizeRatio.width),
        ),
      ),
      padding: EdgeInsets.only(
        top: 16 * _sizeRatio.height,
        bottom: 36 * _sizeRatio.height,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _CustomAppBottomNavigationBarItem(
            sizeRatio: _sizeRatio,
            selectedIndex: _selectedIndex,
            itemIndex: 0,
            onChange: _onChange,
            iconPath: 'assets/images/settings_icon.png',
            title: AppLocalizations.of(context)!.settingsPageTitle,
            selectedIconColor: AppColors.black,
            unSelectedIconColor: AppColors.white,
            selectedTabColor: AppColors.grey,
            unSelectedTabColor: Colors.transparent,
          ),
          _CustomAppBottomNavigationBarItem(
            sizeRatio: _sizeRatio,
            selectedIndex: _selectedIndex,
            itemIndex: 1,
            onChange: _onChange,
            iconPath: 'assets/images/qrcode_icon.png',
            title: AppLocalizations.of(context)!.myCodesPageTitle,
            selectedIconColor: AppColors.black,
            unSelectedIconColor: AppColors.white,
            selectedTabColor: AppColors.grey,
            unSelectedTabColor: Colors.transparent,
          ),
          _CustomAppBottomNavigationBarItem(
            sizeRatio: _sizeRatio,
            selectedIndex: _selectedIndex,
            itemIndex: 2,
            onChange: _onChange,
            iconPath: 'assets/images/profile_icon.png',
            title: AppLocalizations.of(context)!.profilePageTitle,
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

class _CustomAppBottomNavigationBarItem extends StatefulWidget {
  const _CustomAppBottomNavigationBarItem({
    Key? key,
    required Size sizeRatio,
    required int selectedIndex,
    required int itemIndex,
    required void Function({required int index}) onChange,
    required String iconPath,
    required Color selectedIconColor,
    required Color selectedTabColor,
    required String title,
    required Color unSelectedIconColor,
    required Color unSelectedTabColor,
  })  : _onChange = onChange,
        _iconPath = iconPath,
        _itemIndex = itemIndex,
        _selectedIconColor = selectedIconColor,
        _selectedIndex = selectedIndex,
        _selectedTabColor = selectedTabColor,
        _sizeRatio = sizeRatio,
        _title = title,
        _unSelectedIconColor = unSelectedIconColor,
        _unSelectedTabColor = unSelectedTabColor,
        super(key: key);

  final Size _sizeRatio;
  final int _selectedIndex;
  final int _itemIndex;
  final String _iconPath;
  final String _title;
  final Color _unSelectedIconColor;
  final Color _selectedIconColor;
  final Color _unSelectedTabColor;
  final Color _selectedTabColor;

  final void Function({required int index}) _onChange;

  @override
  State<_CustomAppBottomNavigationBarItem> createState() =>
      _CustomAppBottomNavigationBarItemState();
}

class _CustomAppBottomNavigationBarItemState
    extends State<_CustomAppBottomNavigationBarItem>
    with SingleTickerProviderStateMixin {
  late final Animation<double> _animation;
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 250),
      vsync: this,
    );
    final curve = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
    _animation = Tween<double>(
            begin: 20 * widget._sizeRatio.width,
            end: 126 * widget._sizeRatio.width)
        .animate(curve)
      ..addListener(() {
        setState(() {});
      });
    if (widget._selectedIndex == widget._itemIndex) {
      _controller.forward();
    }
  }

  @override
  void didUpdateWidget(covariant _CustomAppBottomNavigationBarItem oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget._selectedIndex == widget._itemIndex) {
      _controller.forward();
    } else if (oldWidget._selectedIndex == widget._itemIndex) {
      _controller.reverse();
    }
  }

  @override
  void dispose() {
    _animation.removeListener(() {
      setState(() {});
    });

    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => widget._onChange(index: widget._itemIndex),
      child: Container(
        height: 48 * widget._sizeRatio.height,
        width: _animation.value,
        decoration: BoxDecoration(
          color: _animation.value > 25 * widget._sizeRatio.width
              ? widget._selectedTabColor
              : widget._unSelectedTabColor,
          borderRadius: BorderRadius.circular(100 * widget._sizeRatio.width),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 20 * widget._sizeRatio.width,
              height: 20 * widget._sizeRatio.width,
              child: Image.asset(
                widget._iconPath,
                fit: BoxFit.contain,
                color: _animation.value > 20 * widget._sizeRatio.width
                    ? widget._selectedIconColor
                    : widget._unSelectedIconColor,
              ),
            ),
            SizedBox(
                width: _animation.value > 40 * widget._sizeRatio.width
                    ? 11 * widget._sizeRatio.width
                    : 0),
            Text(
              _animation.value >= 100 * widget._sizeRatio.width
                  ? widget._title
                  : '',
              style: AppTextStyles.medium(
                fontSize: 14,
                color: AppColors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
