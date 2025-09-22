import '../../common/values/color.dart';
import 'bloc/profile_bloc.dart';
import 'widgets/profile_name.dart';
import 'widgets/profile_top_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../global.dart';
import 'widgets/action_button.dart';
import 'widgets/profile_app_bar.dart';
import 'widgets/profile_image.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final actions = {
    "Settings": "settings.png",
    "Payment details": "credit-card.png",
    "Achievement": "award.png",
    "Love": "heart(1).png",
    "Reminder": "cube.png",
  };

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final userProfile = Global.storageService.getUserProfile;
    context.read<ProfileBloc>().add(ProfileNameEvent(userProfile!));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ProfileAppBar(),
      body: BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, state) {
          return SafeArea(
            child: SingleChildScrollView(
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    ProfileImage(),
                    SizedBox(height: 20.h),
                    ProfileName(state),
                    SizedBox(height: 20.h),
                    ProfileTopButtons(),
                    SizedBox(height: 20.h),
                    ...List.generate(
                      actions.length,
                      (index) => ActionButton(
                        title: actions.keys.elementAt(index),
                        image: actions.values.elementAt(index),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
