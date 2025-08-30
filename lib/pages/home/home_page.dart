import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../common/entities/user.dart';
import '../../common/routes/routes.dart';
import '../../common/values/color.dart';
import 'bloc/home_bloc.dart';
import 'home_controller.dart';
import 'widgets/course_grid_item.dart';
import 'widgets/home_app_bar.dart';
import 'widgets/home_head_text.dart';
import 'widgets/home_search_view.dart';
import 'widgets/menu_button.dart';
import 'widgets/menu_view.dart';
import 'widgets/slider_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // late HomeController _homeController;
  late UserItem? _userProfile;

  @override
  void initState() {
    super.initState();
    // _homeController = HomeController(context: context);
    // _homeController.init();
    _userProfile = HomeController(context: context).profileInfo;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(avatar: _userProfile?.avatar),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state.courses.isEmpty) {
            HomeController(context: context).init();
          }
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 25.w),
            child: CustomScrollView(
              //crossAxisAlignment: CrossAxisAlignment.start,
              slivers: [
                SliverToBoxAdapter(
                  child: HomeHeadText(
                    "Hello,",
                    color: AppColors.primaryThreeElementText,
                    topMargin: 20.h,
                  ),
                ),
                SliverToBoxAdapter(
                  child: HomeHeadText(_userProfile?.name ?? ""),
                ),
                SliverPadding(padding: EdgeInsets.only(top: 20.h)),
                SliverToBoxAdapter(child: HomeSearchView()),
                SliverToBoxAdapter(
                  child: SliderView([
                    "assets/icons/art.png",
                    "assets/icons/art.png",
                    "assets/icons/art.png",
                  ], pageIndex: state.index),
                ),
                SliverToBoxAdapter(child: MenuView()),
                SliverToBoxAdapter(
                  child: Container(
                    margin: EdgeInsets.only(top: 10.h),
                    child: Row(
                      children: [
                        MenuButton('All'),
                        SizedBox(width: 10.w),
                        MenuButton('Popular', isActive: false),
                        SizedBox(width: 10.w),
                        MenuButton('Newest', isActive: false),
                      ],
                    ),
                  ),
                ),
                SliverPadding(
                  padding: EdgeInsets.symmetric(vertical: 18.h),
                  sliver: SliverGrid.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 15,
                      crossAxisSpacing: 15,
                      childAspectRatio: 1.6,
                    ),
                    itemCount: state.courses.length,
                    itemBuilder: (context, i) {
                      return GestureDetector(
                        onDoubleTap: () {},
                        child: GestureDetector(
                          onTap: () => Navigator.of(context).pushNamed(
                            AppRoutes.courseDetail,
                            arguments: {'id': state.courses[i].id},
                          ),
                          child: CourseGridItem(state.courses[i]),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
