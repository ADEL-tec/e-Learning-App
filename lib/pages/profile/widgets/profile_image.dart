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
      child: Image.asset("assets/icons/edit_3.png", width: 25.w, height: 25.w),
    );
  }
}
