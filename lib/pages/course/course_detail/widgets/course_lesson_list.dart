import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../common/routes/routes.dart';
import '../../../../common/values/color.dart';
import '../bloc/course_detail_state.dart';

class CourseLessonList extends StatelessWidget {
  const CourseLessonList(this.state, {super.key});

  final CourseDetailState state;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: NeverScrollableScrollPhysics(),
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: state.lessonItems.length,
        itemBuilder: (context, index) {
          final lesson = state.lessonItems[index];
          return Container(
            width: double.infinity,
            height: 80.h,
            margin: EdgeInsets.only(bottom: 15.h),
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
              onTap: () => Navigator.of(
                context,
              ).pushNamed(AppRoutes.lessonDetail, arguments: lesson.id),
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
                        image: NetworkImage(lesson.thumbnail!),
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
                          lesson.name ?? "--",
                          overflow: TextOverflow.clip,
                          maxLines: 1,
                          style: TextStyle(
                            color: AppColors.primaryText,
                            fontSize: 13.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          lesson.description ?? "--",
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
        },
      ),
    );
  }
}
