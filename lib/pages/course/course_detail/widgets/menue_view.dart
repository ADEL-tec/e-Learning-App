import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../common/values/color.dart';

class MenueView extends StatelessWidget {
  const MenueView({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {},
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
            decoration: BoxDecoration(
              color: AppColors.primaryElement,
              borderRadius: BorderRadius.circular(7.w),
            ),
            child: Text(
              'This Author',
              style: TextStyle(
                color: AppColors.primaryElementText,
                fontSize: 14.sp,
              ),
            ),
          ),
        ),
        _iconNumRow('assets/icons/people.png', 0),
        _iconNumRow('assets/icons/star.png', 0),
      ],
    );
  }

  Widget _iconNumRow(String icon, int num) {
    return Row(
      children: [
        SizedBox(width: 20.w),
        Image.asset(icon, width: 20.w, height: 20.w),
        Text(
          num.toString(),
          style: TextStyle(color: AppColors.primaryThreeElementText),
        ),
      ],
    );
  }
}
