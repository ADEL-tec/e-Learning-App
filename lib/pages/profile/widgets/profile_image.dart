import 'package:elearning/common/values/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.w,
      width: 80.w,
      margin: EdgeInsets.only(top: 20.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50.w),
        image: DecorationImage(image: AssetImage('assets/icons/headpic.png')),
      ),
      alignment: Alignment.bottomRight,
      child: Container(
        padding: EdgeInsets.all(2.w),
        decoration: BoxDecoration(
          color: AppColors.primaryElement,
          borderRadius: BorderRadius.circular(5.w),
        ),
        child: Icon(Icons.edit, size: 20.w, color: Colors.white),
      ),
    );
  }
}
