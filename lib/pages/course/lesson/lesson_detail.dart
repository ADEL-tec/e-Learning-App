import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'bloc/lesson_bloc.dart';
import 'lesson_controller.dart';
import 'widgets/lesson_detail_app_bar.dart';
import 'widgets/lesson_item_card.dart';
import 'widgets/my_video_controls.dart';
import 'widgets/my_video_player.dart';

class LessonDetail extends StatefulWidget {
  const LessonDetail({super.key});

  @override
  State<LessonDetail> createState() => _LessonDetailState();
}

class _LessonDetailState extends State<LessonDetail> {
  late LessonController _lessonController;
  int videoIndex = 0;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    context.read<LessonBloc>().add(UrlItemEvent(null));
    context.read<LessonBloc>().add(TriggerVideoIndexEvent(0));
    _lessonController = LessonController(context);
    _lessonController.init();
  }

  @override
  void dispose() {
    _lessonController.videoPlayerController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LessonDetailAppBar(),
      body: SafeArea(
        child: BlocBuilder<LessonBloc, LessonState>(
          builder: (context, state) {
            return CustomScrollView(
              slivers: [
                SliverPadding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 25.w,
                    vertical: 20.h,
                  ),
                  sliver: SliverToBoxAdapter(
                    child: Column(
                      children: [
                        MyVideoPlayer(
                          controller: _lessonController,
                          state: state,
                        ),
                        MyVideoControls(
                          controller: _lessonController,
                          state: state,
                        ),
                      ],
                    ),
                  ),
                ),
                SliverPadding(
                  padding: EdgeInsets.symmetric(
                    vertical: 18.h,
                    horizontal: 25.w,
                  ),
                  sliver: SliverList(
                    delegate: SliverChildBuilderDelegate((context, index) {
                      return LessonItemCard(
                        context: context,
                        lesson: state.lessonVideoItem[index],
                        index: index,
                        controller: _lessonController,
                      );
                    }, childCount: state.lessonVideoItem.length),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
