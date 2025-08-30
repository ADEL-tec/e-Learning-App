import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../common/values/color.dart';

class GoBuyBtn extends StatelessWidget {
  const GoBuyBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 8.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.w),
        color: AppColors.primaryElement,
      ),
      width: double.infinity,
      child: Center(
        child: Text(
          'Go Buy',
          style: TextStyle(
            color: AppColors.primaryElementText,
            fontSize: 16.sp,
          ),
        ),
      ),
    );
  }
}
