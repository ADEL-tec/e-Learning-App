import '../../../common/apis/lesson_api.dart';
import '../../../common/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../../../common/apis/course_api.dart';
import '../../../common/entities/entities.dart';
import '../../../common/widgets/flutter_toast.dart';
import 'bloc/course_detail_bloc.dart';
import 'bloc/course_detail_event.dart';

class CourseDetailController {
  final BuildContext context;

  CourseDetailController(this.context);

  Future<void> init() async {
    final args = ModalRoute.of(context)!.settings.arguments as Map;

    loadAllData(args['id']);
    loadLessonData(args['id']);
  }

  Future<void> loadAllData(int? id) async {
    CourseRequestEntity courseRequestEntity = CourseRequestEntity();
    courseRequestEntity.id = id;
    final response = await CourseApi.courseDetail(params: courseRequestEntity);
    print(response.data!.toJson());
    if (response.code == 200) {
      if (context.mounted) {
        context.read<CourseDetailBloc>().add(
          CourseDetailTriggerEvent(courseItem: response.data!),
        );
      }
    } else {
      toastInfo(msg: 'somthing went wrong');
      print('---error code : ${response.code}');
    }
  }

  Future<void> goBuy(int id) async {
    EasyLoading.show(
      indicator: CircularProgressIndicator(),
      maskType: EasyLoadingMaskType.clear,
      dismissOnTap: true,
    );

    final CourseRequestEntity courseRequestEntity = CourseRequestEntity();
    courseRequestEntity.id = id;
    final result = await CourseApi.coursePay(params: courseRequestEntity);
    EasyLoading.dismiss();

    if (result.code == 200) {
      print(" debug =>> ${result.data}");
      final url = Uri.decodeFull(result.data!);
      print('stripe url: $url');

      final res = await Navigator.of(
        context,
      ).pushNamed(AppRoutes.payWebView, arguments: url);

      if (res == "success") {
        toastInfo(msg: "You bought it successfully");
      }
    } else {
      toastInfo(msg: result.msg!);
    }
  }

  Future<void> loadLessonData(int id) async {
    LessonRequestEntity lessonRequestEntity = LessonRequestEntity();
    lessonRequestEntity.id = id;
    final result = await LessonApi.lessonList(params: lessonRequestEntity);
    if (result.code == 200) {
      if (context.mounted) {
        context.read<CourseDetailBloc>().add(
          LessonListTriggerEvent(lessonItems: result.data!),
        );
      }
    } else {
      toastInfo(msg: result.msg ?? 'somthing went wrong');
      print('---error code : ${result.code}');
    }
  }
}
