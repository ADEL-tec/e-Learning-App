import '../bloc/lesson_bloc.dart';
import '../lesson_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:video_player/video_player.dart';

import '../../../../common/values/color.dart';

class MyVideoPlayer extends StatelessWidget {
  const MyVideoPlayer({
    super.key,
    required this.controller,
    required this.state,
  });

  final LessonState state;
  final LessonController controller;

  @override
  Widget build(BuildContext context) {
    return state.lessonVideoItem.isEmpty
        ? Center(child: CircularProgressIndicator())
        : Container(
            // width: 600,
            height: 200.h,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              image: DecorationImage(
                image: NetworkImage(
                  state.lessonVideoItem[state.videoIndex].thumbnail!,
                ), //AssetImage("assets/icons/video(1).png"),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(20.h),
            ),
            child: FutureBuilder(
              future: state.initializeVideoPlayerFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return controller.videoPlayerController == null
                      ? SizedBox.shrink()
                      : AspectRatio(
                          aspectRatio: controller
                              .videoPlayerController!
                              .value
                              .aspectRatio,
                          child: Stack(
                            alignment: Alignment.bottomCenter,
                            children: [
                              VideoPlayer(controller.videoPlayerController!),
                              VideoProgressIndicator(
                                controller.videoPlayerController!,
                                allowScrubbing: true,
                                colors: VideoProgressColors(
                                  playedColor: AppColors.primaryElement,
                                ),
                              ),
                            ],
                          ),
                        );
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              },
            ),
          );
  }
}
