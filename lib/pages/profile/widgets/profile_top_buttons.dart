import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/values/color.dart';

class ProfileTopButtons extends StatelessWidget {
  const ProfileTopButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 24.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildBtn(
            title: "My Courses",
            iconName: "profile_video",
            onTap: () {},
          ),
          _buildBtn(
            title: "Buy Courses",
            iconName: "profile_video",
            onTap: () {},
          ),
          _buildBtn(title: "3.9", iconName: "profile_video", onTap: () {}),
        ],
      ),
    );
  }

  Widget _buildBtn({
    required String title,
    required String iconName,
    required Function()? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 90.w,
        margin: EdgeInsets.symmetric(horizontal: 5.w),
        padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 7.h),
        decoration: BoxDecoration(
          color: AppColors.primaryElement,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withAlpha(80),
              spreadRadius: 2,
              blurRadius: 3,
              offset: Offset(0, 3),
            ),
          ],
          borderRadius: BorderRadius.circular(15.w),
        ),
        child: Column(
          children: [
            SizedBox(
              width: 24.w,
              height: 24.w,
              child: Image.asset("assets/icons/$iconName.png"),
            ),
            Text(
              title,
              style: TextStyle(
                color: AppColors.primaryElementText,
                fontSize: 11.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
