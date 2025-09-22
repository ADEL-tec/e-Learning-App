import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../common/widgets/flutter_toast.dart';
import '../bloc/lesson_bloc.dart';
import '../lesson_controller.dart';

class MyVideoControls extends StatelessWidget {
  const MyVideoControls({
    super.key,
    required this.controller,
    required this.state,
  });

  final LessonState state;
  final LessonController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              var videoIndex = context.read<LessonBloc>().state.videoIndex;
              if (videoIndex == 0) {
                toastInfo(msg: 'This is the first video you are watching');
              } else {
                videoIndex--;
                final videItem = state.lessonVideoItem.elementAt(videoIndex);
                controller.playVideo(videItem.url!);
              }
              context.read<LessonBloc>().add(
                TriggerVideoIndexEvent(videoIndex),
              );
            },
            child: Container(
              height: 24.w,
              width: 24.w,
              margin: EdgeInsets.only(right: 15.w),
              child: Image.asset("assets/icons/rewind-left.png"),
            ),
          ),
          GestureDetector(
            onTap: () {
              if (state.isPlay) {
                controller.videoPlayerController!.pause();
                context.read<LessonBloc>().add(TriggerPlayEvent(false));
              } else {
                controller.videoPlayerController!.play();
                context.read<LessonBloc>().add(TriggerPlayEvent(true));
              }
            },
            child: state.isPlay
                ? SizedBox(
                    height: 24.w,
                    width: 24.w,
                    child: Image.asset("assets/icons/pause.png"),
                  )
                : SizedBox(
                    height: 24.w,
                    width: 24.w,
                    child: Image.asset("assets/icons/play-circle.png"),
                  ),
          ),
          GestureDetector(
            onTap: () {
              var videoIndex = context.read<LessonBloc>().state.videoIndex;
              if (videoIndex == state.lessonVideoItem.length - 1) {
                toastInfo(msg: 'No videos in the playlist');
              } else {
                videoIndex++;
                final videItem = state.lessonVideoItem.elementAt(videoIndex);
                controller.playVideo(videItem.url!);
              }
              context.read<LessonBloc>().add(
                TriggerVideoIndexEvent(videoIndex),
              );
            },
            child: Container(
              height: 24.w,
              width: 24.w,
              margin: EdgeInsets.only(left: 15.w),
              child: Image.asset("assets/icons/rewind-right.png"),
            ),
          ),
        ],
      ),
    );
  }
}
