import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/values/color.dart';

class HomeSearchView extends StatelessWidget {
  const HomeSearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 40.h,
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            decoration: BoxDecoration(
              color: AppColors.primaryBackground,
              border: Border.all(
                width: 1,
                color: AppColors.primaryFourElementText,
              ),
              borderRadius: BorderRadius.circular(12.w),
            ),
            child: Row(
              children: [
                SizedBox(
                  height: 14.w,
                  width: 14.w,
                  child: Image.asset("assets/icons/search.png"),
                ),
                Expanded(
                  child: TextField(
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      hintText: 'Search your course',
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
                    style: TextStyle(
                      color: AppColors.primaryText,
                      fontSize: 12.sp,
                    ),
                    autocorrect: false,
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(width: 5.w),
        GestureDetector(
          child: Container(
            width: 40.w,
            height: 40.w,
            padding: EdgeInsets.all(8.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.w),
              color: AppColors.primaryElement,
            ),
            child: Image.asset("assets/icons/options.png"),
          ),
        ),
      ],
    );
  }
}
