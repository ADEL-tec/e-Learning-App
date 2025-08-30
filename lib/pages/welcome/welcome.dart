import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../common/routes/routes.dart';
import '../../common/values/color.dart';
import '../../common/values/constants.dart';
import '../../global.dart';
import 'bloc/welcome_bloc.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  final PageController _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SizedBox(
          width: 375.w,
          child: BlocBuilder<WelcomeBloc, WelcomePageChangedState>(
            builder: (context, state) {
              return Stack(
                alignment: Alignment.topCenter,
                children: [
                  PageView(
                    controller: _pageController,
                    onPageChanged: (value) {
                      state.page = value;
                      BlocProvider.of<WelcomeBloc>(
                        context,
                      ).add(WelcomeChangePageEvent());
                    },
                    children: [
                      _page(
                        index: 1,
                        context: context,
                        title: "First See Learning",
                        subtitle:
                            "Forgot about a for of paper all knowledge in",
                        imagePath: "assets/images/onboarding/reading.png",
                        buttonName: "Next",
                      ),
                      _page(
                        index: 2,
                        context: context,
                        title: "Connect with everyone",
                        subtitle:
                            "Always keep in toutch in your tutor & friend. lets get connect",
                        imagePath: "assets/images/onboarding/boy.png",
                        buttonName: "Next",
                      ),
                      _page(
                        index: 3,
                        context: context,
                        title: "Always facinated learning",
                        subtitle:
                            "Anywhere, any time. The time is at our discretion ,zlef,ifzek",
                        imagePath: "assets/images/onboarding/man.png",
                        buttonName: "Get Started",
                      ),
                    ],
                  ),
                  Positioned(
                    bottom: 60.h,
                    child: DotsIndicator(
                      dotsCount: 3,
                      position: state.page.toDouble(),
                      mainAxisAlignment: MainAxisAlignment.center,
                      decorator: DotsDecorator(
                        color: AppColors.primaryThreeElementText,
                        activeColor: AppColors.primaryElement,
                        size: Size.square(8),
                        activeSize: Size(15, 8),
                        activeShape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusGeometry.circular(5),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Column _page({
    required int index,
    required BuildContext context,
    required String title,
    required String subtitle,
    required String buttonName,
    required String imagePath,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: 345.w,
          height: 345.w,
          child: Image.asset(imagePath, fit: BoxFit.cover),
        ),
        Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 24.sp,
            color: AppColors.primaryText,
            fontWeight: FontWeight.bold,
          ),
        ),
        Container(
          width: 345.w,
          padding: EdgeInsets.symmetric(horizontal: 30.w),
          child: Text(
            subtitle,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14.sp,
              color: AppColors.primarySecondaryElementText,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            if (index < 3) {
              _pageController.animateToPage(
                index,
                duration: Duration(milliseconds: 400),
                curve: Curves.decelerate,
              );
            } else {
              Global.storageService.setBool(
                AppConstants.STORAGE_DEVICE_OPEN_FIRST_OPEN,
                true,
              );
              Navigator.pushNamedAndRemoveUntil(
                context,
                AppRoutes.signIn,
                (_) => false,
              );
            }
          },
          child: Container(
            margin: EdgeInsets.only(top: 100.h, left: 25.w, right: 25.w),
            width: 325.w,
            height: 50.h,
            decoration: BoxDecoration(
              color: AppColors.primaryElement,
              borderRadius: BorderRadius.circular(15.w),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withAlpha(90),
                  spreadRadius: 1,
                  blurRadius: 2,
                  offset: Offset(0, 1),
                ),
              ],
            ),
            child: Center(
              child: Text(
                buttonName,
                style: TextStyle(fontSize: 16.sp, color: Colors.white),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
