import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/values/color.dart';

class MenuView extends StatelessWidget {
  const MenuView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15.h),
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            "Choose your course",
            style: TextStyle(
              fontSize: 16.sp,
              color: AppColors.primaryText,
              fontWeight: FontWeight.bold,
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Text(
              "See All",
              style: TextStyle(
                fontSize: 12.sp,
                color: AppColors.primaryThreeElementText,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
