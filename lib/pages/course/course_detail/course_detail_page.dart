import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/values/color.dart';
import 'bloc/course_detail_bloc.dart';
import 'bloc/course_detail_state.dart';
import 'course_detail_controller.dart';
import 'widgets/course_detail_app_bar.dart';
import 'widgets/course_detail_head_text.dart';
import 'widgets/course_lesson_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'widgets/course_summary.dart';
import 'widgets/description_txt.dart';
import 'widgets/go_buy_btn.dart';
import 'widgets/menue_view.dart';
import 'widgets/thumbnail.dart';

class CourseDetailPage extends StatefulWidget {
  const CourseDetailPage({super.key});

  @override
  State<CourseDetailPage> createState() => _CourseDetailPageState();
}

class _CourseDetailPageState extends State<CourseDetailPage> {
  late CourseDetailController _courseDetailController;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _courseDetailController = CourseDetailController(context);
    _courseDetailController.init();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CourseDetailBloc, CourseDetailState>(
      builder: (context, state) {
        if (state.courseItem != null) {
          final course = state.courseItem!;
          return Scaffold(
            backgroundColor: AppColors.primaryBackground,
            appBar: CourseDetailAppBar(),
            body: SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Thumbnail(course.thumbnail!),
                      SizedBox(height: 15.h),
                      MenueView(),
                      SizedBox(height: 15.h),
                      CourseDetailHeadText("Course description"),
                      SizedBox(height: 15.h),
                      DescriptionTxt(course.description ?? '--'),
                      SizedBox(height: 15.h),
                      GestureDetector(
                        onTap: () {
                          _courseDetailController.goBuy(course.id!);
                        },
                        child: GoBuyBtn(),
                      ),
                      SizedBox(height: 15.h),
                      CourseDetailHeadText("The course includes"),
                      SizedBox(height: 15.h),
                      CourseSummary(
                        videoLength: course.video_len ?? 0,
                        lessonNum: course.lesson_num ?? 0,
                        downNum: course.down_num ?? 0,
                      ),
                      SizedBox(height: 15.h),
                      CourseDetailHeadText("Lesson List"),
                      SizedBox(height: 15.h),
                      CourseLessonList(),
                    ],
                  ),
                ),
              ),
            ),
          );
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}
