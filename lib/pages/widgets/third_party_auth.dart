import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ThirdPartyAuth extends StatelessWidget {
  const ThirdPartyAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 18.h, bottom: 18.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildSocialBtn(onTap: () {}, iconName: "google"),
          SizedBox(width: 25.w),
          _buildSocialBtn(onTap: () {}, iconName: "apple"),
          SizedBox(width: 25.w),
          _buildSocialBtn(onTap: () {}, iconName: "facebook"),
        ],
      ),
    );
  }

  GestureDetector _buildSocialBtn({
    required Function()? onTap,
    required String iconName,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: 40.w,
        width: 40.w,
        child: Image.asset("assets/icons/$iconName.png"),
      ),
    );
  }
}
