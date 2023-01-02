import 'package:flutter/material.dart';

import '../config/colors.dart';

class CustomAppBottomNavigationBar extends StatefulWidget {
  const CustomAppBottomNavigationBar({
    Key? key,
    required this.sizeRatio,
    required this.initialIndex,
  }) : super(key: key);

  final Size sizeRatio;

  final int initialIndex;

  @override
  State<CustomAppBottomNavigationBar> createState() =>
      _CustomAppBottomNavigationBarState();
}

class _CustomAppBottomNavigationBarState
    extends State<CustomAppBottomNavigationBar> {
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
    required sizeRatio,
    required selectedIndex,
    required itemIndex,
    required onChange,
    required iconPath,
    required selectedIconColor,
    required selectedTabColor,
    required title,
    required unSelectedIconColor,
    required unSelectedTabColor,
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
  State<_AppBottomNavBarItem> createState() => _AppBottomNavBarItemState();
}

class _AppBottomNavBarItemState extends State<_AppBottomNavBarItem>
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
  void didUpdateWidget(covariant _AppBottomNavBarItem oldWidget) {
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
