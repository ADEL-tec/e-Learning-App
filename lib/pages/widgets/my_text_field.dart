import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../common/values/color.dart';

class MyTextField extends StatelessWidget {
  final String text;
  final TextInputType textType;
  final String iconName;
  final String hintText;
  final Function(String)? onChanged;
  const MyTextField({
    super.key,
    required this.text,
    required this.textType,
    required this.iconName,
    required this.hintText,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 325.w,
      height: 50.h,
      padding: EdgeInsets.only(left: 16.w, right: 10.w),
      margin: EdgeInsets.only(bottom: 20.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.w),
        border: Border.all(color: Colors.black),
      ),
      child: Row(
        children: [
          Image.asset("assets/icons/$iconName.png", width: 16.w, height: 16.w),
          Expanded(
            child: TextField(
              onChanged: onChanged,
              keyboardType: textType,
              obscureText: textType == TextInputType.visiblePassword
                  ? true
                  : false,
              decoration: InputDecoration(
                hintText: hintText,
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                ),
                disabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                ),
                hintStyle: TextStyle(
                  color: AppColors.primarySecondaryElementText,
                ),
              ),
              style: TextStyle(color: AppColors.primaryText, fontSize: 12.sp),
              autocorrect: false,
            ),
          ),
        ],
      ),
    );
  }
}
