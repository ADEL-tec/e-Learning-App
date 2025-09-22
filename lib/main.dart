import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'common/routes/routes.dart';
import 'common/values/color.dart';
import 'global.dart';

void main() async {
  await Global.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [...AppPages.allBLocBroviders],
      child: ScreenUtilInit(
        designSize: Size(375, 812),
        builder: (context, child) => MaterialApp(
          builder: EasyLoading.init(),
          debugShowCheckedModeBanner: false,
          title: 'e-learning',
          theme: ThemeData(
            scaffoldBackgroundColor: AppColors.primaryBackground,
            appBarTheme: AppBarTheme(
              backgroundColor: Colors.white,
              elevation: 0,
            ),
            colorScheme: ColorScheme.fromSeed(
              seedColor: AppColors.primaryElement,
            ),
          ),
          onGenerateRoute: AppPages.onGenerateRoute,
          // initialRoute: AppRoutes.initial,
          // routes: {
          //   AppRoutes.initial: (context) => Welcome(),
          //   AppRoutes.signIn: (context) => SignIn(),
          //   AppRoutes.register: (context) => Register(),
          //   // ApplicationPage.routeName: (context) => ApplicationPage(),
          // },
        ),
      ),
    );
  }
}
