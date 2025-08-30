import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../common/values/color.dart';

enum AuthType { login, register }

class AuthBtn extends StatelessWidget {
  const AuthBtn({
    super.key,
    required this.btnType,
    required this.text,
    this.onTap,
  });

  final AuthType btnType;
  final String text;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 325.w,
        height: 50.h,
        margin: EdgeInsets.only(
          left: 25.w,
          right: 25.w,
          top: btnType == AuthType.login ? 40.h : 10.h,
        ),
        decoration: BoxDecoration(
          color: btnType == AuthType.login
              ? AppColors.primaryElement
              : AppColors.primaryBackground,
          borderRadius: BorderRadius.circular(15.w),
          border: btnType == AuthType.register
              ? Border.all(color: AppColors.primaryThreeElementText)
              : null,
          boxShadow: [
            BoxShadow(
              spreadRadius: 1,
              blurRadius: 2,
              offset: Offset(0, 1),
              color: Colors.grey.withAlpha(90),
            ),
          ],
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 16.sp,
              color: btnType != AuthType.login
                  ? AppColors.primaryElement
                  : AppColors.primaryBackground,
            ),
          ),
        ),
      ),
    );
  }
}
