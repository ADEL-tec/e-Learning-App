import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/values/color.dart';

class MenuButton extends StatelessWidget {
  const MenuButton(this.title, {super.key, this.isActive = true});

  final String title;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.w),
        color: isActive ? AppColors.primaryElement : Colors.transparent,
      ),
      child: Text(
        title,
        style: TextStyle(
          color: isActive ? Colors.white : AppColors.primaryThreeElementText,
          fontSize: 11.sp,
        ),
      ),
    );
  }
}
