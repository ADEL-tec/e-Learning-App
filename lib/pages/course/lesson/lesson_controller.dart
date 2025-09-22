import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_player/video_player.dart';

import '../../../common/apis/lesson_api.dart';
import '../../../common/entities/lesson.dart';
import 'bloc/lesson_bloc.dart';

class LessonController {
  final BuildContext context;

  LessonController(this.context);

  VideoPlayerController? videoPlayerController;

  Future<void> init() async {
    final id = ModalRoute.of(context)!.settings.arguments as int;

    context.read<LessonBloc>().add(TriggerPlayEvent(false));

    loadLessonData(id);
  }

  Future<void> loadLessonData(int? id) async {
    LessonRequestEntity lessonRequestEntity = LessonRequestEntity();
    lessonRequestEntity.id = id;
    final result = await LessonApi.lessonDetail(params: lessonRequestEntity);
    if (result.code == 200) {
      if (context.mounted) {
        context.read<LessonBloc>().add(LessonVideoEvent(result.data!));
      }
      if (result.data!.isNotEmpty) {
        final url = result.data!.elementAt(0).url;
        videoPlayerController = VideoPlayerController.networkUrl(
          // Uri.parse("https://www.pexels.com/download/video/7279832/"),
          Uri.parse(url!),
        );
        print(url);
        final initPlayer = videoPlayerController?.initialize();
        context.read<LessonBloc>().add(UrlItemEvent(initPlayer));
      }
    }
  }

  void playVideo(String url) {
    if (videoPlayerController != null) {
      videoPlayerController?.pause();
      videoPlayerController?.dispose();
    }

    videoPlayerController = VideoPlayerController.networkUrl(Uri.parse(url));
    context.read<LessonBloc>().add(TriggerPlayEvent(false));
    context.read<LessonBloc>().add(UrlItemEvent(null));
    final initFeaturePlayzer = videoPlayerController?.initialize().then((
      value,
    ) {
      videoPlayerController?.seekTo(Duration(milliseconds: 0));
    });
    context.read<LessonBloc>().add(UrlItemEvent(initFeaturePlayzer));
    context.read<LessonBloc>().add(TriggerPlayEvent(true));

    videoPlayerController?.play();
  }
}
