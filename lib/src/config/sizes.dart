import 'package:flutter/material.dart';

abstract class AppSizes {
  static Size getSizeRatio(BuildContext context) {
    final safeBlockHorizontal = (MediaQuery.of(context).size.width -
            MediaQuery.of(context).padding.left +
            MediaQuery.of(context).padding.right) /
        360;
    final safeBlockVertical = (MediaQuery.of(context).size.height -
            MediaQuery.of(context).padding.top +
            MediaQuery.of(context).padding.bottom) /
        740;
    return Size(safeBlockHorizontal, safeBlockVertical);
  }
}
