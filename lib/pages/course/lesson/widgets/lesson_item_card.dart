import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../common/entities/lesson.dart';
import '../bloc/lesson_bloc.dart';
import '../lesson_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LessonItemCard extends StatelessWidget {
  const LessonItemCard({
    super.key,
    required this.context,
    required this.index,
    required this.lesson,
    required this.controller,
  });

  final LessonVideoItem lesson;
  final int index;
  final BuildContext context;
  final LessonController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.h,
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 15.h),
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.w),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withAlpha(80),
            blurRadius: 3,
            spreadRadius: 2,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: InkWell(
        onTap: () {
          // controller.playVideo(
          //   "https://www.pexels.com/download/video/7279832/",
          // );
          context.read<LessonBloc>().add(TriggerVideoIndexEvent(index));
          controller.playVideo(lesson.url!);
        },
        child: Row(
          children: [
            Container(
              width: 60.w,
              height: 60.w,
              margin: EdgeInsets.only(right: 10.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.w),
                image: DecorationImage(
                  image: NetworkImage(lesson.thumbnail!),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              child: Text(
                lesson.name!,
                style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
              ),
            ),
            Image.asset(
              'assets/icons/play-circle.png',
              width: 24.w,
              height: 24.w,
            ),
          ],
        ),
      ),
    );
  }
}
