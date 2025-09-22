import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../common/apis/course_api.dart';
import '../../common/entities/user.dart';
import '../../global.dart';
import 'bloc/home_bloc.dart';

class HomeController {
  late BuildContext context;
  UserItem? get profileInfo => Global.storageService.getUserProfile;

  static final HomeController _homeInstance = HomeController._();

  HomeController._();

  factory HomeController({required BuildContext context}) {
    _homeInstance.context = context;
    return _homeInstance;
  }

  Future<void> init() async {
    if (Global.storageService.getUserToken.isNotEmpty) {
      final response = await CourseApi.courseList();
      if (response.code == 200) {
        if (context.mounted) {
          context.read<HomeBloc>().add(HomeFetchCoursesEvent(response.data!));
        }
      } else {
        print(response.code);
      }
    } else {
      print('user has already logged out');
    }
    return;
  }
}
