import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/entities/entities.dart';
import '../../../common/values/color.dart';
import '../../../common/values/constants.dart';

class CourseGridItem extends StatelessWidget {
  const CourseGridItem(this.courseItem, {super.key});

  final CourseItem courseItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 12.h),
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.w),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(
            '${AppConstants.SERVER_UPLOADS}${courseItem.thumbnail}',
          ),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            courseItem.name ?? "",
            overflow: TextOverflow.fade,
            maxLines: 1,
            softWrap: false,
            style: TextStyle(
              color: AppColors.primaryElementText,
              fontWeight: FontWeight.bold,
              fontSize: 11.sp,
            ),
          ),
          SizedBox(height: 2.sp),
          Text(
            courseItem.description ?? "",
            overflow: TextOverflow.fade,
            maxLines: 1,
            softWrap: false,
            style: TextStyle(
              color: AppColors.primaryFourElementText,
              fontSize: 8.sp,
            ),
          ),
        ],
      ),
    );
  }
}
