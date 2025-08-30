import '../../../../common/values/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CourseLessonList extends StatelessWidget {
  const CourseLessonList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 80.h,
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            blurRadius: 3,
            spreadRadius: 2,
            offset: Offset(0, 1),
            color: Colors.grey.withAlpha(50),
          ),
        ],
      ),
      child: InkWell(
        onTap: () {},
        child: Row(
          children: [
            Container(
              width: 60.w,
              height: double.infinity,
              margin: EdgeInsets.only(right: 8.w),
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.w),
                image: DecorationImage(
                  image: AssetImage('assets/icons/image_1.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "UI Design",
                    overflow: TextOverflow.clip,
                    maxLines: 1,
                    style: TextStyle(
                      color: AppColors.primaryText,
                      fontSize: 13.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "data",
                    overflow: TextOverflow.clip,
                    maxLines: 2,
                    style: TextStyle(
                      color: AppColors.primaryThreeElementText,
                      fontSize: 11.sp,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ),
            Image.asset(
              'assets/icons/arrow_right.png',
              height: 24.h,
              width: 24.h,
            ),
          ],
        ),
      ),
    );
  }
}
