import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../common/values/color.dart';

class LightText extends StatelessWidget {
  const LightText(this.text, {super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 5.h),
      child: Text(
        text,
        style: TextStyle(
          color: AppColors.primaryFourElementText,
          fontSize: 14.sp,
        ),
      ),
    );
  }
}
