import 'package:elearning/pages/course/course_detail/bloc/course_detail_bloc.dart';

import '../../pages/course/course_detail/course_detail_page.dart';

import '../../pages/home/bloc/home_bloc.dart';
import '../../pages/home/home_page.dart';
import '../../pages/profile/settings/bloc/settings_bloc.dart';
import '../../pages/profile/settings/settings_page.dart';

import '../../global.dart';
import '../../pages/application/application_page.dart';
import '../../pages/application/bloc/app_bloc.dart';

import 'names.dart';
import '../../pages/register/bloc/register_bloc.dart';
import '../../pages/register/register.dart';
import '../../pages/signin/bloc/sign_in_bloc.dart';
import '../../pages/signin/sign_in.dart';
import '../../pages/welcome/bloc/welcome_bloc.dart';
import '../../pages/welcome/welcome.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppPages {
  static final List<PageEntity> _routes = [
    PageEntity(
      route: AppRoutes.initial,
      page: Welcome(),
      bloc: BlocProvider<WelcomeBloc>(create: (context) => WelcomeBloc()),
    ),
    PageEntity(
      route: AppRoutes.signIn,
      page: SignIn(),
      bloc: BlocProvider<SignInBloc>(create: (context) => SignInBloc()),
    ),
    PageEntity(
      route: AppRoutes.register,
      page: Register(),
      bloc: BlocProvider<RegisterBloc>(create: (context) => RegisterBloc()),
    ),
    PageEntity(
      route: AppRoutes.application,
      page: ApplicationPage(),
      bloc: BlocProvider<AppBloc>(create: (context) => AppBloc()),
    ),
    PageEntity(
      route: AppRoutes.home,
      page: HomePage(),
      bloc: BlocProvider<HomeBloc>(create: (context) => HomeBloc()),
    ),
    PageEntity(
      route: AppRoutes.settings,
      page: SettingsPage(),
      bloc: BlocProvider<SettingsBloc>(create: (context) => SettingsBloc()),
    ),
    PageEntity(
      route: AppRoutes.courseDetail,
      page: CourseDetailPage(),
      bloc: BlocProvider<CourseDetailBloc>(
        create: (context) => CourseDetailBloc(),
      ),
    ),
  ];

  static List<dynamic> get allBLocBroviders =>
      _routes.map((e) => e.bloc).toList();

  static MaterialPageRoute onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.initial:
        final deviceFirstOpen = Global.storageService.getDeviceFirstOpen;
        dynamic page;
        if (deviceFirstOpen) {
          final isLoggedIn = Global.storageService.getIsLoggedIn;
          if (isLoggedIn) {
            page = _getPage(AppRoutes.application);
          } else {
            page = _getPage(AppRoutes.signIn);
          }
        } else {
          page = _getPage(AppRoutes.initial);
        }
        return MaterialPageRoute(
          builder: (context) => page,
          settings: settings,
        );
      case AppRoutes.signIn:
        final isLoggedIn = Global.storageService.getIsLoggedIn;
        dynamic page;
        if (isLoggedIn) {
          page = _getPage(AppRoutes.application);
        } else {
          page = _getPage(AppRoutes.signIn);
        }
        return MaterialPageRoute(
          builder: (context) => page,
          settings: settings,
        );
      case AppRoutes.register:
        dynamic page;
        final isLoggedIn = Global.storageService.getIsLoggedIn;
        if (isLoggedIn) {
          page = _getPage(AppRoutes.application);
        } else {
          page = _getPage(AppRoutes.register);
        }
        return MaterialPageRoute(
          builder: (context) => page,
          settings: settings,
        );
      case AppRoutes.application:
        final page = _getPage(AppRoutes.application);
        return MaterialPageRoute(
          builder: (context) => page,
          settings: settings,
        );
      case AppRoutes.settings:
        final page = _getPage(AppRoutes.settings);
        return MaterialPageRoute(
          builder: (context) => page,
          settings: settings,
        );
      case AppRoutes.courseDetail:
        final page = _getPage(AppRoutes.courseDetail);
        return MaterialPageRoute(
          builder: (context) => page,
          settings: settings,
        );
      // case AppRoutes.home:
      //   final page = _getPage(AppRoutes.home);
      //   return MaterialPageRoute(
      //     builder: (context) => page,
      //     settings: settings,
      //   );
      default:
        final page = _getPage(AppRoutes.initial);
        return MaterialPageRoute(
          builder: (context) => page,
          settings: settings,
        );
    }
  }

  static _getPage(String page) =>
      _routes.firstWhere((e) => e.route == page).page;
}

class PageEntity {
  String route;
  Widget page;
  dynamic bloc;

  PageEntity({required this.route, required this.page, required this.bloc});
}
