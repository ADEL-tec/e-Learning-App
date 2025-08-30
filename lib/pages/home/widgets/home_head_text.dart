import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/values/color.dart';

class HomeHeadText extends StatelessWidget {
  const HomeHeadText(
    this.text, {
    super.key,
    this.color = AppColors.primaryText,
    this.topMargin,
  });

  final String text;
  final Color? color;
  final double? topMargin;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: topMargin ?? 0),
      child: Text(
        text,
        style: TextStyle(
          color: color,
          fontSize: 24.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
