import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../common/values/color.dart';
import 'bloc/app_bloc.dart';
import 'widgets/app_widgets.dart';

class ApplicationPage extends StatefulWidget {
  const ApplicationPage({super.key});

  @override
  State<ApplicationPage> createState() => _ApplicationPageState();
}

class _ApplicationPageState extends State<ApplicationPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: AppColors.primaryBackground,
          body: SafeArea(child: buildPage(state.index)),
          bottomNavigationBar: Container(
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(top: Radius.circular(20.h)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withAlpha(50),
                  spreadRadius: 1,
                  blurRadius: 1,
                ),
              ],
            ),
            child: NavigationBar(
              backgroundColor: AppColors.primaryBackground,
              onDestinationSelected: (value) {
                context.read<AppBloc>().add(AppTriggerEvent(value));
                // setState(() {
                //   _index = value;
                // });
                // print(_index);
              },
              selectedIndex: state.index,
              indicatorColor: AppColors.primaryElement,
              surfaceTintColor: Colors.white,
              destinations: bottomTabs,
            ),
          ),
        );
      },
    );
  }
}
