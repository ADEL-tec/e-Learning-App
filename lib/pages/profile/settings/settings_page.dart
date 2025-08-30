import '../../home/bloc/home_bloc.dart';

import '../../../common/routes/routes.dart';
import '../../../common/values/constants.dart';
import '../../application/bloc/app_bloc.dart';
import 'widgets/settings_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../global.dart';
import 'bloc/settings_bloc.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SettingsAppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: BlocBuilder<SettingsBloc, SettingsState>(
            builder: (context, state) {
              return Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text('Confirm Logout'),
                            content: Text('Confirm Logout'),
                            actions: [
                              TextButton(
                                onPressed: () => _signOut(context),
                                child: Text("Confirm"),
                              ),
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: Text("Cancel"),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: Image.asset(
                      'assets/icons/Logout.png',
                      height: 100.h,
                      width: double.infinity,
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

  void _signOut(BuildContext context) {
    Global.storageService.remove(AppConstants.STORAGE_USER_TOKEN_KEY);
    Global.storageService.remove(AppConstants.STORAGE_USER_PROFILE_KEY);
    Navigator.pushNamedAndRemoveUntil(
      context,
      AppRoutes.signIn,
      (route) => false,
    );
    context.read<AppBloc>().add(AppTriggerEvent(0));
    context.read<HomeBloc>().add(HomeDotsEvent(0));
  }
}
