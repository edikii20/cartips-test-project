import 'package:flutter/material.dart';

import '../config/styles/colors.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key? key,
    required Size sizeRatio,
    required String title,
    List<IconButton>? actions,
  })  : _sizeRatio = sizeRatio,
        _title = title,
        _actions = actions,
        super(key: key);

  final Size _sizeRatio;
  final String _title;
  final List<IconButton>? _actions;

  List<Widget> _separatedActionsList() {
    List<Widget> separatedList = [_actions![0]];
    if (_actions!.length > 1) {
      for (var i = 1; i < _actions!.length; i++) {
        separatedList.addAll([
          SizedBox(width: 10 * _sizeRatio.width),
          _actions![i],
        ]);
      }
    }

    return separatedList;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 20 * _sizeRatio.width,
        right: 24 * _sizeRatio.width,
        top: 15 * _sizeRatio.height,
        bottom: 14 * _sizeRatio.height,
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              _title,
              style: TextStyle(
                color: AppColors.black,
                fontFamily: 'Roboto',
                fontSize: 24,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          if (_actions?.isNotEmpty ?? false) ..._separatedActionsList(),
        ],
      ),
    );
  }
}
